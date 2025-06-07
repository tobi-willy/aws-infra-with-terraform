resource "aws_vpc" "main" {
  cidr_block = var.vpc_cidr 

  tags = {
    Name = "main_vpc"
  }
}

resource "aws_subnet" "public" {
  for_each = var.public_subnets

  vpc_id = aws_vpc.main.id
  cidr_block = each.value.cidr_block
  availability_zone = each.value.az
  map_public_ip_on_launch = true

  tags = {
    Name = "public_subnet-${each.key}"
  }
}

resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.main.id
}

resource "aws_route_table" "public_rt" {
  vpc_id = aws_vpc.main.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw.id
  }
}

resource "aws_subnet" "private" {
  for_each = {
    subnet_a = "10.0.3.0/24"
    subnet_b = "10.0.4.0/24"
  }

  vpc_id = aws_vpc.main.id
  cidr_block = each.value
  availability_zone = each.key == "subnet_a" ? "us-east-2a" : "us-east-2b"
  map_public_ip_on_launch = false
}

resource "aws_route_table_association" "public_assoc" {
  for_each = aws_subnet.public

  subnet_id  =  each.value.id
  route_table_id = aws_route_table.public_rt.id
}
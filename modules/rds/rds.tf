resource "aws_db_subnet_group" "db_subnet" {
  name_prefix =  "db-subnet-"
  subnet_ids = var.private_subnet

  tags = {
    Name = "db-subnet-group"
  }
}


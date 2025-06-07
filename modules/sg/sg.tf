resource "aws_security_group" "ssh_sg" {
    name = "allow_ssh"
    description = "Allow SSH inbound"
    vpc_id = var.main_vpc

    dynamic "ingress" {
     for_each = var.ingress_ports
     content {
       from_port = ingress.value
       to_port = ingress.value
       protocol = "tcp"
       cidr_blocks = ["0.0.0.0/0"]
     }
    }
    
    egress {
        from_port = 0
        to_port = 0
        protocol = "-1"
        cidr_blocks = ["0.0.0.0/0"]
    }
}

resource "aws_security_group" "app_sg" {
  name = "app_sg"
  description = "Allow HTTP from web tier only"
  vpc_id = var.main_vpc

  dynamic "ingress" {
    for_each = var.app_ingress_ports
    content {
      from_port = ingress.value
      to_port = ingress.value
      protocol = "tcp"
      security_groups = [aws_security_group.bastion_sg.id]
    }
  }

  egress {
    from_port = 0
    to_port = 0
    protocol = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "app-sg"
  }
}

resource "aws_security_group" "rds_sg" {
  name = "rds_sg"
  description = "Allow DB access from app tier"
  vpc_id = var.main_vpc
  
  ingress {
    from_port =  3306
    to_port = 3306
    protocol = "tcp"
    security_groups = [aws_security_group.app_sg.id]
  }

  egress {
    from_port = 0
    to_port = 0
    protocol = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    name = "rds-sg"
  }

}

resource "aws_security_group" "bastion_sg" {
  name        = "bastion-sg"
  description = "Allow SSH access to Bastion"
  vpc_id      = var.main_vpc

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["69.117.56.170/32"] 
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

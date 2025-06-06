variable "aws_region" {
  default = "us-east-2"
}

variable "vpc_cidr" {
  default = "10.0.0.0/16"
}

variable "public_subnet_cidr" {
  default = "10.0.1.0/24"
}

variable "key_name" {
  description = "terraform key"
}

variable "ingress_ports" {
  type = list(number)
  default = [ 22, 80 ]  
}

variable "app_ingress_ports" {
  type = list(number)
  default = [22, 5000]
}

variable "public_subnets" {
  type = map(object({
    cidr_block = string
    az = string
  }))
  default = {
    subnet_a = {
      cidr_block = "10.0.10.0/24"
      az = "us-east-2a"
    }
    subnet_b = {
      cidr_block = "10.0.2.0/24"
      az = "us-east-2b"
    }
  }
}

variable "db_password" {
  description = "Master password for the RDS instance"
  type = string
  sensitive = true
}
variable "key_name" {
  type = string
  description = "terraform key"
}

variable "db_password" {
    type = string
    sensitive = true
    description = "Master password for the RDS instance"
}

variable "app_sg" {
  type        = string
  description = "ID of the APP security group"
}

variable "ssh_sg" {
  type        = string
  description = "ID of the SSH security group (used for web tier)"
}

variable "rds_sg" {
  type        = string
  description = "ID of the RDS security group"
}

variable "db_subnet_group" {
  type        = string
  description = "Name of the RDS DB subnet group"
}

variable "subnet_private" {
  type = string
}

variable "bastion_sg" {
  type = string
}

variable "subnet_public" {
  type = string
}
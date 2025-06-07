variable "vpc_id" {
  description = "The ID of the VPC"
}

variable "public_subnets" {
 description = "List of public subnet IDs"
  type        = list(string)
}

variable "ssh_sg_id" {
  description = "ID of the security group for the ALB"
} 

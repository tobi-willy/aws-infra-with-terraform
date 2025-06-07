variable "vpc_cidr" {
  type = string
}

variable "public_subnets" {
  type = map(object({
    cidr_block = string
    az = string
  }))
}
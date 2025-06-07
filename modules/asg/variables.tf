variable "public_subnets" {
  type        = list(string)
  description = "List of public subnet IDs"
}

variable "target_group_arn" {
  type        = string
  description = "ARN of the ALB target group"
}

variable "launch_template_id" {
  type        = string
  description = "Launch template ID"
}

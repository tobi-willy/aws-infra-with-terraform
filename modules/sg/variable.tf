variable "ingress_ports" {
  type = list(number)
}

variable "app_ingress_ports" {
   type = list(number)
}

variable "main_vpc" {
  type = string
}
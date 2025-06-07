output "alb_dns_name" {
  value = module.alb.alb_dns_name
}

output "instance_private_ip" {
  value = module.ec2.app_private_ip
}

output "rds_endpoint" {
  value = module.ec2.rds_endpoint
}

output "bastion_public_ip" {
  value = module.ec2.bastion_public_ip
}
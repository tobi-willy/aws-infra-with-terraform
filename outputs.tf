output "instance_public_ip" {
  value = aws_instance.web.public_ip
}

output "alb_dns_name" {
  value = aws_lb.web_alb.dns_name
}

output "instance_private_ip" {
  value = aws_instance.app.private_ip
}

output "rds_endpoint" {
  value = aws_db_instance.app-db.endpoint
     
}
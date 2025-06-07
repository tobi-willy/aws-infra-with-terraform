output "launch_template_id" {
  value = aws_launch_template.web_template.id
}

output "app_private_ip" {
  value = aws_instance.app.private_ip
}

output "rds_endpoint" {
  value = aws_db_instance.app-db.endpoint
}

output "bastion_public_ip" {
  value = aws_instance.bastion.public_ip
}
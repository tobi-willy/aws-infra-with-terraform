output "ssh_sg" {
  value = aws_security_group.ssh_sg.id
}

output "app_sg" {
  value = aws_security_group.app_sg.id
}

output "rds_sg" {
  value = aws_security_group.rds_sg.id
}

output "bastion_sg" {
  value = aws_security_group.bastion_sg.id
}

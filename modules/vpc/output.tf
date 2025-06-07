output "subnet_private" {
  value = aws_subnet.private["subnet_a"].id
}

output "subnet_public" {
  value = aws_subnet.public["subnet_a"].id
}

output "main_vpc" {
  value = aws_vpc.main.id
}

output "private_subnet_a" {
  value = aws_subnet.private["subnet_a"].id
}

output "private_subnet_b" {
  value = aws_subnet.private["subnet_b"].id
}

output "private_subnet" {
  value = [aws_subnet.private["subnet_a"].id, aws_subnet.private["subnet_b"].id]
}

output "public_subnet" {
  value = [for s in aws_subnet.public : s.id]
}

output "pub_subnet" {
  value = [aws_subnet.public["subnet_a"].id, aws_subnet.public["subnet_b"].id]
}
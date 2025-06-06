resource "aws_db_subnet_group" "db_subnet" {
  name = "db-subnet-group"
  subnet_ids = [aws_subnet.private["subnet_a"].id, aws_subnet.private["subnet_b"].id]

  tags = {
    Name = "db-subnet-group"
  }
}


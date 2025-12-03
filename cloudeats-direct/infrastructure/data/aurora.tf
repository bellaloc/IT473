resource "random_password" "rds" {
  length  = 16
  special = true
}

resource "aws_db_subnet_group" "main" {
  name       = "cloudeats-db-subnets"
  subnet_ids = [aws_subnet.private_a.id, aws_subnet.private_b.id]
}

resource "aws_rds_cluster" "aurora" {
  engine               = "aurora-mysql"
  engine_mode          = "serverless"
  database_name        = "cloudeats"
  master_username      = "admin"
  master_password      = random_password.rds.result
  db_subnet_group_name = aws_db_subnet_group.main.name
  vpc_security_group_ids = [aws_security_group.rds.id]
}

resource "aws_secretsmanager_secret" "db" {
  name = "cloudeats-db-credentials"
}

resource "aws_secretsmanager_secret_version" "db" {
  secret_id = aws_secretsmanager_secret.db.id
  secret_string = jsonencode({
    username = "admin"
    password = random_password.rds.result
    host     = aws_rds_cluster.aurora.endpoint
  })
}

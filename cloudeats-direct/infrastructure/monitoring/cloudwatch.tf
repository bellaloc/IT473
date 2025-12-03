resource "aws_cloudwatch_log_group" "microservices" {
  name              = "/cloudeats/microservices"
  retention_in_days = 30
}

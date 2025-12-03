resource "aws_cloudwatch_log_group" "ecs_logs" {
  name              = "/cloudeats/ecs"
  retention_in_days = 30
}

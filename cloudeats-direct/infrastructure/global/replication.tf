resource "aws_s3_bucket_replication_configuration" "frontend" {
  role = aws_iam_role.ecs_task_exec.arn

  rules {
    id     = "replicate"
    status = "Enabled"
    destination {
      bucket = aws_s3_bucket.shared.arn
    }
    source_selection_criteria {}
  }
}

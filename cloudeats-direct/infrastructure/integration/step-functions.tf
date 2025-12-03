resource "aws_sfn_state_machine" "order_flow" {
  name     = "cloudeats-order-flow"
  role_arn = aws_iam_role.ecs_task_exec.arn
  definition = jsonencode({
    Comment: "Order workflow",
    StartAt: "Start",
    States: {
      Start: {
        Type: "Pass",
        End: true
      }
    }
  })
}

resource "aws_lambda_function" "example" {
  function_name = "cloudeats-example-lambda"
  handler       = "index.handler"
  runtime       = "nodejs18.x"
  role          = aws_iam_role.ecs_task_exec.arn
  filename      = "lambda.zip"
}

resource "aws_xray_group" "cloudeats" {
  filter_expression = "service(\"cloudeats\")"
  group_name        = "cloudeats-xray"
}

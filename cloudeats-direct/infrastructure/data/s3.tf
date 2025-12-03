resource "aws_s3_bucket" "frontend" {
  bucket = "cloudeats-frontend-${var.env}"
  acl    = "private"
}

resource "aws_s3_bucket" "shared" {
  bucket = "cloudeats-shared-${var.env}"
  acl    = "private"
}

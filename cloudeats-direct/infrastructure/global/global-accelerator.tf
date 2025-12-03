resource "aws_globalaccelerator_accelerator" "cloudeats" {
  name               = "cloudeats-ga"
  enabled            = true
  ip_address_type    = "IPV4"
}

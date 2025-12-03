resource "aws_wafv2_web_acl" "main" {
  name  = "cloudeats-waf"
  scope = "REGIONAL"
  default_action { allow {} }
  
  rule {
    name     = "AWS-Auto-IP-Reputation"
    priority = 1

    override_action { none {} }

    statement {
      managed_rule_group_statement {
        vendor_name = "AWS"
        name        = "AWSManagedRulesAmazonIpReputationList"
      }
    }

    visibility_config {
      sampled_requests_enabled    = true
      cloudwatch_metrics_enabled  = true
      metric_name                 = "ipreputation"
    }
  }

  visibility_config {
    sampled_requests_enabled   = true
    cloudwatch_metrics_enabled = true
    metric_name                = "cloudeats-waf"
  }
}

resource "aws_acm_certificate" "certificate" {
  provider          = aws.cloudfront
  domain_name       = var.distribution_fqdn
  validation_method = "DNS"
  lifecycle {
    create_before_destroy = true
  }

  tags = var.common_tags
}

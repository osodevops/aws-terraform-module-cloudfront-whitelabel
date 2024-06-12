output "logging_bucket" {
  value = module.bucket_cloudwatch_logs_backup.s3_id
}

output "distribution" {
  value = aws_cloudfront_distribution.s3_distribution
}

output "identity" {
  value = aws_cloudfront_origin_access_identity.current
}

output "certificate_validation" {
  value = {
    for dvo in aws_acm_certificate.certificate.domain_validation_options : dvo.domain_name => {
      name   = dvo.resource_record_name
      type   = dvo.resource_record_type
      record = dvo.resource_record_value
    }
  }
  description = "DNS validation details for the certificate"
}
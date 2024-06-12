variable "cloudfront_cache_min_ttl" {
  type        = number
  description = "The minimum amount of time that you want objects to stay in CloudFront caches before CloudFront queries."
  default     = 30
}

variable "cloudfront_cache_default_ttl" {
  type        = number
  description = "he default amount of time (in seconds) that an object is in a CloudFront cache before CloudFront forwards another request."
  default     = 90
}

variable "cloudfront_cache_max_ttl" {
  type        = number
  description = "The maximum amount of time (in seconds) that an object is in a CloudFront cache before CloudFront forwards another request."
  default     = 300
}

variable "cloudfront_cache_compress_content" {
  type        = bool
  description = "Whether you want CloudFront to automatically compress content for web requests that include Accept-Encoding: gzip in the request header"
  default     = false
}

variable "common_tags" {
  type        = map(string)
  description = "Implements the common tags."
}

variable "distribution_fqdn" {
  type        = string
  description = "Fully qualified domain bound to Cloudfront."
}

variable "distribution_name" {
  type        = string
  description = "A unique name give to the distribution."
}

variable "hosted_zone_name" {
  type        = string
  description = "The route53 zone."
}

variable "price_class" {
  type        = string
  description = "The price class for this distribution."
  default     = "PriceClass_100"
}

variable "s3_source_bucket_name" {
  type = string
}

variable "ttl" {
  type    = string
  default = "300"
}

variable "lambda_function_association" {
  type = list(object({
    event_type   = string
    include_body = bool
    lambda_arn   = string
  }))

  description = "A config block that triggers a lambda function with specific actions"
  default     = []
}

variable "use_cloudfront_default_certificate" {
  type        = bool
  description = "Default SSL certificate."
  default     = false
}

variable "web_acl_id" {
  type        = string
  description = "Optional WAF Id to associate with the distribution"
  default     = ""
}

locals {
  logging_bucket_name = "${var.distribution_name}-cf-logs-${data.aws_region.current.name}-${lower(data.aws_iam_account_alias.current.account_alias)}"
}

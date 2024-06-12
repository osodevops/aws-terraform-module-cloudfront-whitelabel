provider "aws" {
  region  = "us-east-1"  # Certificate has to be created in us-east-1 due to cloudfront pre-requisites
  alias = "cloudfront"
}
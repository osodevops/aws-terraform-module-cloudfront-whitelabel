# AWS Terraform Module Cloudfront Whitelabel
A terraform module for deploying Cloudfront backed by S3  for DNS whitelabeling via distributions

This module is intended to allow managing many domains routing to backends via cloudfront.
We assume that
- DNS is managed outside of AWS
- S3 is the backing store for cache content
- You know how to use terraform :-)


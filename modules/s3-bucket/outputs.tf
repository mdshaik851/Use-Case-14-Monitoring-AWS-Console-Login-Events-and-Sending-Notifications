output "depends_on_s3_bucket_object" {
  value = aws_s3_bucket_policy.cloudtrail_bucket_policy
}
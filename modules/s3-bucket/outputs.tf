output "depends_on_s3_bucket_object" {
  value = aws_s3_bucket_policy.cloudtrail_bucket_policy
}
output "cloudtrail_s3_bucket_arn" {
  value = aws_s3_bucket.cloudtrail_logs.arn
}

output "cloudtrail_s3_bucket" {
value = aws_s3_bucket.cloudtrail_logs.bucket
}
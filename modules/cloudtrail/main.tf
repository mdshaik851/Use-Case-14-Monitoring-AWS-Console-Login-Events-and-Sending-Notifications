resource "aws_cloudtrail" "console_trail" {
  name                          = "console-login-trail"
  s3_bucket_name                = var.s3_bucket_name
  include_global_service_events = true
  is_multi_region_trail         = true
  enable_log_file_validation    = true
  cloud_watch_logs_role_arn     = var.cloudwatch_role_arn
  cloud_watch_logs_group_arn    = "${var.log_group_arn}:*"
#   is_logging                    = true
  depends_on                    = [aws_s3_bucket.cloudtrail_bucket]
}

resource "aws_s3_bucket" "cloudtrail_bucket" {
  bucket = var.s3_bucket_name
}

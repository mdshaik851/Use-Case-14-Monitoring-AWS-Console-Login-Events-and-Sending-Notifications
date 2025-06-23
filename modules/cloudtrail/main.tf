resource "aws_cloudtrail" "main" {
  name                          = var.trail_name
  s3_bucket_name                = var.s3_bucket_name
  include_global_service_events = true
  is_multi_region_trail         = true
  enable_log_file_validation    = true
  cloud_watch_logs_group_arn    = var.cloudwatch_logs_group_arn
  cloud_watch_logs_role_arn     = var.cloudwatch_logs_role_arn


}

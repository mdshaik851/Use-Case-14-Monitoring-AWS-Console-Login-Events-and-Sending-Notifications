variable "trail_name" {
  default     = "aws-login-trail"
  type        = string
  description = "Name of the CloudTrail trail"
}

variable "s3_bucket_name" {
  default     = "uc-14-consolelogintrail"
  type        = string
  description = "S3 bucket name to store CloudTrail logs"
}

variable "cloudwatch_logs_role_arn" {
  default     = "arn:aws:iam::123456789012:role/CloudTrailCWLogsRole"
  type        = string
  description = "IAM role ARN for CloudTrail to send logs to CloudWatch"
}

variable "topic_name" {
  default     = "aws-console-login-topic"
  type        = string
  description = "SNS topic name for login notifications"
}

variable "email_address" {
  default     = "mohammedabdul.shaik@hcltech.com"
  type        = string
  description = "Email address to receive login notifications"
}

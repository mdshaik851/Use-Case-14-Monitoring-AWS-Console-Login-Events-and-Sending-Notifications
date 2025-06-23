variable "cloudtrail_bucket_name" {
  description = "Name of the S3 bucket for CloudTrail logs"
  type        = string
  default     = "uc-14-log-console-activity"
}

variable "notification_email_addresses" {
  description = "List of email addresses to receive notifications"
  default     = "md939255shaik@gmail.com"
}

variable "sns_topic_name" {
  description = "Name of the SNS topic"
  type        = string
  default     = "ConsoleLoginAlerts"
}

variable "alarm_name" {
  description = "Name of the CloudWatch alarm"
  type        = string
  default     = "ConsoleLoginAlarm"
}

variable "metric_name" {
  description = "Name of the CloudWatch metric"
  type        = string
  default     = "ConsoleLoginEvents"
}

variable "metric_namespace" {
  description = "Namespace for the CloudWatch metric"
  type        = string
  default     = "ConsoleLogin"
}

variable "filter_pattern" {
  description = "Filter pattern for CloudWatch Logs metric filter"
  type        = string
  default     = "{ ($.eventName = \"ConsoleLogin\") && ($.responseElements.ConsoleLogin = \"Success\") }"
}
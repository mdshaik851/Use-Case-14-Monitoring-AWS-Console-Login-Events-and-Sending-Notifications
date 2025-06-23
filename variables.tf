variable "trail_name"
{
default = "aws-login-trail"
type = string
}

variable "s3_bucket_name"
{
default = "uc-14-consolelogintrail"
type = string
}

variable "cloudwatch_logs_role_arn"
{
default = "arn:aws:iam::123456789012:role/CloudTrailCWLogsRole"
type = string   
}.

variable "topic_name"
{
default = "aws-console-login-topic"
type = string   
}

variable "email_address"
{
default = "mohammedabdul.shaik@hcltech.com"
type = string   
}
variable "s3_bucket_name" {}
variable "cloudwatch_role_arn" {}
variable "log_group_arn" {}
variable "cloudwatch_role_dependency" {
  description = "Dummy input for depends_on on CloudWatch IAM role"
  type        = string
}

variable "cloudwatch_log_group_dependency" {
  description = "Dummy input for depends_on on CloudWatch Log Group"
  type        = string
}

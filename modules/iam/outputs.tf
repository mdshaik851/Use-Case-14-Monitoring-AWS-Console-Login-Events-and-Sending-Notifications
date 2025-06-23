output "cloudtrail_logs_role_arm" {
  value       = aws_iam_role.cloudtrail_logs_role.arn
  description = "ARN of the Cloud Trail"
}

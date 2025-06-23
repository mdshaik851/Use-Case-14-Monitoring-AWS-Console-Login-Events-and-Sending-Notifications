output "cloudtrail_logs_role_arn" {  # Fixed the typo here
  value       = aws_iam_role.cloudtrail_logs_role.arn
  description = "ARN of the CloudTrail CloudWatch Logs Role"
}
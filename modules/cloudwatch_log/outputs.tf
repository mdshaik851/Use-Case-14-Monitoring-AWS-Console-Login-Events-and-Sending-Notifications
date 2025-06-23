output "log_group_arn" {
  value       = aws_cloudwatch_log_group.login_logs.arn
  description = "ARN of the CloudWatch Logs group"
}

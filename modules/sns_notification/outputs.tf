output "sns_topic_arn" {
  value       = aws_sns_topic.login_topic.arn
  description = "ARN of the SNS topic"
}

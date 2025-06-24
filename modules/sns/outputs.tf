output "login_topic_arn" {
  description = "ARN of the SNS topic"
  value       = aws_sns_topic.login_topic.arn
}

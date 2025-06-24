output "sns_topic_arn" {
  value = module.sns.login_topic_arn
}

output "cloudwatch_log_group" {
  value = module.cloudwatch.log_group_arn
}

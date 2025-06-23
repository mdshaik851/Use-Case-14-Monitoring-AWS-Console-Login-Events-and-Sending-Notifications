resource "aws_sns_topic" "login_topic" {
  name = "console-login-topic"
}

resource "aws_sns_topic_subscription" "email_subscription" {
  topic_arn = aws_sns_topic.login_topic.arn
  protocol  = "email"
  endpoint  = var.email_address
}

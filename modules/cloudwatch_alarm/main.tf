resource "aws_cloudwatch_metric_alarm" "console_login_alarm" {
  alarm_name          = "ConsoleLoginAlarm"
  comparison_operator = "GreaterThanOrEqualToThreshold"
  evaluation_periods  = 1
  metric_name         = "ConsoleLoginSuccessCount"
  namespace           = "LoginMonitoring"
  period              = 60
  statistic           = "Sum"
  threshold           = 1
  alarm_description   = "Alarm for successful AWS Console login"
  alarm_actions       = [var.sns_topic_arn]
}

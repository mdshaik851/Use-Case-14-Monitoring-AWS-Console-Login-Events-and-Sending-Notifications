resource "aws_cloudwatch_log_group" "login_log_group" {
  name              = "/aws/cloudtrail/login-events"
  retention_in_days = 14
}

resource "aws_cloudwatch_log_metric_filter" "console_login_filter" {
  name           = "ConsoleLoginSuccessFilter"
  log_group_name = aws_cloudwatch_log_group.login_log_group.name
  pattern        = "{ $.eventName = \"ConsoleLogin\" && $.responseElements.ConsoleLogin = \"Success\" }"

  metric_transformation {
    name      = "ConsoleLoginSuccessCount"
    namespace = "LogMetrics"
    value     = "1"
  }
}

resource "aws_cloudwatch_metric_alarm" "login_alarm" {
  alarm_name                = "ConsoleLoginSuccessAlarm"
  comparison_operator       = "GreaterThanOrEqualToThreshold"
  evaluation_periods        = "1"
  metric_name               = aws_cloudwatch_log_metric_filter.console_login_filter.metric_transformation[0].name
  namespace                 = "LogMetrics"
  period                    = "60"
  statistic                 = "Sum"
  threshold                 = "1"
  alarm_description         = "Alarm for successful AWS Console logins"
  alarm_actions             = [var.sns_topic_arn]
}

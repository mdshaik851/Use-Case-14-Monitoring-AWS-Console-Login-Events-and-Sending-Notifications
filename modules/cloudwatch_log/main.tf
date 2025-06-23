resource "aws_cloudwatch_log_group" "login_logs" {
  name = var.log_group_name
}

resource "aws_cloudwatch_log_metric_filter" "console_login_filter" {
  name           = "ConsoleLoginSuccess"
  log_group_name = aws_cloudwatch_log_group.login_logs.name
  pattern        = "{ ($.eventName = \"ConsoleLogin\") && ($.responseElements.ConsoleLogin = \"Success\") }"

  metric_transformation {
    name      = "ConsoleLoginSuccessCount"
    namespace = "LoginMonitoring"
    value     = "1"
  }
}

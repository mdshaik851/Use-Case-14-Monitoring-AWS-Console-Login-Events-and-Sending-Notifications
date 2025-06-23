provider "aws" {
  region = "us-east-1"
}

module "sns" {
  source        = "./modules/sns"
  email_address = "md939255shaik@gmail.com"
}

module "cloudwatch" {
  source        = "./modules/cloudwatch"
  sns_topic_arn = module.sns.login_topic_arn
}

module "cloudtrail" {
  source             = "./modules/cloudtrail"
  s3_bucket_name     = "cloudtrail-console-login-bucket"
  cloudwatch_role_arn = aws_iam_role.cloudtrail_cw_role.arn
  log_group_arn      = module.cloudwatch.login_log_group_arn
}

resource "aws_iam_role" "cloudtrail_cw_role" {
  name = "CloudTrailCloudWatchLogsRole"
  assume_role_policy = jsonencode({
    Version = "2012-10-17",
    Statement = [{
      Effect = "Allow",
      Principal = {
        Service = "cloudtrail.amazonaws.com"
      },
      Action = "sts:AssumeRole"
    }]
  })
}

resource "aws_iam_role_policy" "cloudtrail_policy" {
  name = "CloudTrailCWPolicy"
  role = aws_iam_role.cloudtrail_cw_role.id
  policy = jsonencode({
    Version = "2012-10-17",
    Statement = [{
      Effect = "Allow",
      Action = [
        "logs:PutLogEvents",
        "logs:CreateLogStream",
        "logs:CreateLogGroup",
        "logs:DescribeLogStreams"
      ],
      Resource = "*"
    }]
  })
}

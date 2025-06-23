terraform {
  required_version = ">= 1.0"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

provider "aws" {
  region = "us-west-1"  # Updated to us-west-1
}

module "iam_role" {
  source = "./modules/iam"
}

module "sns_notification" {
  source        = "./modules/sns_notification"
  topic_name    = var.topic_name
  email_address = var.email_address
}

module "cloudwatch_logs" {
  source         = "./modules/cloudwatch_log"
  log_group_name = "/aws/cloudtrail/login-events"
}

module "cloudtrail" {
  source                    = "./modules/cloudtrail"
  trail_name                = var.trail_name
  s3_bucket_name            = var.s3_bucket_name
  cloudwatch_logs_group_arn = "${module.cloudwatch_logs.log_group_arn}:*"  # Ensure ":*" suffix
  cloudwatch_logs_role_arn  = module.iam_role.cloudtrail_logs_role_arn

  depends_on = [
    module.cloudwatch_logs,
    module.iam_role,
    aws_iam_role_policy.cloudtrail_logs_policy  # Explicit policy dependency
  ]
}

module "cloudwatch_alarm" {
  source        = "./modules/cloudwatch_alarm"
  sns_topic_arn = module.sns_notification.sns_topic_arn
}
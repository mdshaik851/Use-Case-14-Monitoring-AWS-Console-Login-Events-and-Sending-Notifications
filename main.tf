# Configure the AWS Provider
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
  region = "us-west-1" # Mumbai region
}


module "sns_notification" {
  source       = "./modules/sns_notification"
  topic_name   = var.topic_name
  email_address = var.email_address
}

module "cloudwatch_logs" {
  source         = "./modules/cloudwatch_logs"
  log_group_name = "/aws/cloudtrail/login-events"
}

module "cloudtrail" {
  source                    = "./modules/cloudtrail"
  trail_name                = var.trail_name
  s3_bucket_name            = var.s3_bucket_name
  cloudwatch_logs_group_arn = module.cloudwatch_logs.login_logs_arn
  cloudwatch_logs_role_arn  = var.cloudwatch_logs_role_arn
}

module "cloudwatch_alarm" {
  source        = "./modules/cloudwatch_alarm"
  sns_topic_arn = module.sns_notification.login_topic_arn
}

provider "aws" {
  region = "us-west-1"
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
  source                = "./modules/cloudtrail"
  s3_bucket_name        = "uc-14-login-console-activity"
  cloudwatch_log_group_arn  = module.cloudwatch.cloudwatch_log_group_arn
  depends_on_cloudwatch_log_group = module.cloudwatch.depends_on_cloudwatch_log_group
  depends_on_s3_bucket_object     = module.S3.depends_on_s3_bucket_object
}
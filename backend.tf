terraform {
  backend "s3" {
    bucket       = "uc-14-consolelogintrail"
    key          = "uc-14-consolelogintrail"
    region       = "us-west-1"
    encrypt      = true
    use_lockfile = true
  }
}
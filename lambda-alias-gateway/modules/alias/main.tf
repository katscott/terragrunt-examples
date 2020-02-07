provider "aws" {
  region = var.aws_region
}

terraform {
  # The configuration for this backend will be filled in by Terragrunt
  backend "s3" {}

  # The latest version of Terragrunt (v0.19.0 and above) requires Terraform 0.12.0 or above.
  required_version = ">= 0.12.0"
}

data "aws_lambda_function" "function" {
  function_name = var.function_name
  qualifier     = var.qualifier
}

resource "aws_lambda_alias" "stable_alias" {
  name             = "stable"
  description      = "stable version"
  function_name    = data.aws_lambda_function.function.arn
  function_version = data.aws_lambda_function.function.version
}

provider "aws" {
  region = var.aws_region
}

terraform {
  # The configuration for this backend will be filled in by Terragrunt
  backend "s3" {}

  # The latest version of Terragrunt (v0.19.0 and above) requires Terraform 0.12.0 or above.
  required_version = ">= 0.12.0"
}

resource "aws_iam_role" "lambda_exec_role" {
  name               = "node12x_lambda_exec_role"
  assume_role_policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Action": "sts:AssumeRole",
      "Principal": {
        "Service": "lambda.amazonaws.com"
      },
      "Effect": "Allow",
      "Sid": ""
    }
  ]
}
EOF
}

resource "aws_lambda_function" "function" {
  function_name    = "terragrunt-lambda"
  handler          = "handler.handler"
  runtime          = "nodejs12.x"
  filename         = var.file_path
  publish          = true
  source_code_hash = filesha256(var.file_path)
  role             = aws_iam_role.lambda_exec_role.arn
}

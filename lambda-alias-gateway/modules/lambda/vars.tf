variable "aws_region" {
  description = "The AWS region to deploy to (e.g. us-east-1)"
  type        = string
}

variable "file_path" {
  description = "The path to the lambda zip"
  type        = string
}

variable "aws_region" {
  description = "The AWS region to deploy to (e.g. us-east-1)"
  type        = string
}

variable "function_name" {
  description = "The function name"
  type        = string
}

variable "qualifier" {
  description = "The qualifier"
  type        = string
}
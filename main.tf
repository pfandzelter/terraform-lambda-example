# This is required to get the AWS region via data.aws_region.current.
data "aws_region" "current" {}

variable "name" {
  type = string
  description = "Name of the Lambda function."
}

# This module will load all Terraform files from the "lambda" folder.
module "go-lambda" {
  source = ".//lambda"

  function_name = var.name

  filename = "bin.zip"
  source_code_hash = filebase64sha256("bin.zip")
  handler = "bin"

  memory_size = 128
  timeout = 1

  basic-exec-role-name = "${var.name}-basic-execution"
  logging-role-name = "${var.name}-logging"
}
variable "function_name" {
  type = string
  description = "Name of Lambda function."
}

variable "filename" {
  type = string
  description = "Filename of archive that contains the compiled binary."
}

variable "handler" {
  type = string
  description = "Filename of the binary."
}

variable "source_code_hash" {
  type = string
  description = "Hash of the archive."
}

variable "memory_size" {
  type = number
  description = "Memory size for Lambda function in MB."
}

variable "timeout" {
  type = number
  description = "Timeout of Lambda function in s."
}

# Define a Lambda function.
#
# The handler is the name of the executable for go1.x runtime.
resource "aws_lambda_function" "go-lambda" {
  function_name    = var.function_name
  filename         = var.filename
  handler          = var.handler
  source_code_hash = var.source_code_hash
  role             = aws_iam_role.go-lambda-exec-role.arn
  runtime          = "go1.x"
  memory_size      = var.memory_size
  timeout          = var.timeout
}
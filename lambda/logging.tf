variable "logging-role-name" {
  type = string
  description = "Name for logging policy."
}

# We also want our Lambda function to write logs to CloudWatch. To create a log stream
# and write logs, it needs the right permissions.
#
# The date 2012-10-17 is just the version of the policy language used here [1].
#
# [1]: https://docs.aws.amazon.com/IAM/latest/UserGuide/reference_policies_elements_version.html
resource "aws_iam_policy" "go-lambda-logging-policy" {
  name = var.logging-role-name
  path = "/"
  description = "IAM policy for logging from a lambda"

  policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Action": [
        "logs:CreateLogGroup",
        "logs:CreateLogStream",
        "logs:PutLogEvents"
      ],
      "Resource": "arn:aws:logs:*:*:*",
      "Effect": "Allow"
    }
  ]
}
EOF
}

resource "aws_iam_role_policy_attachment" "go-lambda-logging-policy-assn" {
  role = aws_iam_role.go-lambda-exec-role.name
  policy_arn = aws_iam_policy.go-lambda-logging-policy.arn
}
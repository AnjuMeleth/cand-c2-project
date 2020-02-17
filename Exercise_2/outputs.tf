# TODO: Define the output variable for the lambda function.
output "role_arn" {
  description = "The ARN of the IAM role created for the Lambda function"
  value       = "${aws_iam_role.iam_for_lambda.arn}"
}

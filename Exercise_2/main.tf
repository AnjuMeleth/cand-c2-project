provider "aws" {
  region     = var.region
}
resource "aws_iam_role" "iam_for_lambda" {
  name = "iam_for_lambda"

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

data "archive_file" "greet_lambda" {
  type        = "zip"
  source_file = "greet_lambda.py"
  output_path = "var.lambda_zip_location"
}
resource "aws_lambda_function" "test_lambda" {
  filename      = "var.lambda_zip_location"
  function_name = "greet_lambda"
  role          = "${aws_iam_role.iam_for_lambda.arn}"
  handler       = "greet_lambda.lambda_handler"

  # The filebase64sha256() function is available in Terraform 0.11.12 and later
  # For Terraform 0.11.11 and earlier, use the base64sha256() function and the file() function:
   #source_code_hash = "${base64sha256(file("var.lambda_zip_location"))}"
 source_code_hash = "${filebase64sha256("var.lambda_zip_location")}"

  runtime = "python3.7"

environment {
    variables = {
      greeting = "hello"
    }
  }
}

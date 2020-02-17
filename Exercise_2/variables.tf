# TODO: Define the variable for aws_region

variable "region" {
  default = "us-west-2"
}


variable "lambda_zip_location" {
  type    = list(string)
  default = ["outputs/greet_lambda.zip"]
}

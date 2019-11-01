## Variable for provider connexions
variable "aws_region" {
  description = "AWS region to launch servers."
}

variable "aws_profile" {
  description = "The AWS profile to use."
}

# Specify the provider and access details
provider "aws" {
#  version    = "2.30.0"
  region     = "${var.aws_region}"
  profile    = "${var.aws_profile}"
}

# Generates an IAM policy document
data "aws_iam_policy_document" "s3_readonly" {
  statement {
    actions   = [ "s3:Get*", "s3:List*" ]
    effect    = "Allow"
    resources = [ "*" ]
  }
}

module "role_custom_identifier" {
  source               = "JousP/iam-assumeRole/aws"
  version              = "1.0.1"
  name                 = "custom"
  description          = "Custom role with customization for who can assume it"
  identifier           = "arn:aws:iam::*:root"
  path                 = "/custom/"
  max_session_duration = "7200"
  tags                 = "${map("Environment", "Test")}"
}

# Generates an IAM policy document
data "aws_iam_policy_document" "role_custom_assumeRole" {
  statement {
    actions       = [ "sts:AssumeRole" ]
    principals {
      type        = "Service"
      identifiers = [ "ec2.amazonaws.com" ]
    }
    effect        = "Allow"
  }
}

module "role_custom_assumeRole" {
  source               = "JousP/iam-assumeRole/aws"
  version              = "1.0.1"
  name                 = "custom-assumeRole"
  description          = "Custom role with customization the assume_role policy"
  assume_role_policy   = "${data.aws_iam_policy_document.role_custom_assumeRole.json}"
  path                 = "/custom/"
  max_session_duration = "7200"
  permissions_boundary = ""
  policies_count       = 1
  policies             = ["arn:aws:iam::aws:policy/ReadOnlyAccess"]
  json_policies_count  = 1
  json_policies        = ["${data.aws_iam_policy_document.s3_readonly.json}"]
  tags                 = "${map("Environment", "Test")}"
}

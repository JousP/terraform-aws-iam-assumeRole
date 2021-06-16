# Generates an IAM policy document
data "aws_iam_policy_document" "s3_bucket1_readonly" {
  statement {
    actions   = ["s3:Get*", "s3:List*"]
    effect    = "Allow"
    resources = ["arn:aws:s3:::bucket1*"]
  }
}

data "aws_iam_policy_document" "s3_bucket2_readonly" {
  statement {
    actions   = ["s3:Get*", "s3:List*"]
    effect    = "Allow"
    resources = ["arn:aws:s3:::bucket2*"]
  }
}

module "role_custom_policies_strict" {
  source              = "JousP/iam-assumeRole/aws"
  version             = "~> 3.1"
  name                = "custom-policies-trict"
  description         = "Custom role with fixed and strict inline and managed policies"
  path                = "/custom/"
  managed_policy_arns = ["arn:aws:iam::aws:policy/ReadOnlyAccess"]
  inline_policy = [
    {
      name   = "ReadOnlyBucket1"
      policy = data.aws_iam_policy_document.s3_bucket1_readonly.json
    },
    {
      name   = "ReadOnlyBucket2"
      policy = data.aws_iam_policy_document.s3_bucket2_readonly.json
    }
  ]
}


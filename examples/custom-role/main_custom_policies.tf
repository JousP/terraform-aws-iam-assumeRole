# Generates an IAM policy document
data "aws_iam_policy_document" "s3_all_readonly" {
  statement {
    actions   = ["s3:Get*", "s3:List*"]
    effect    = "Allow"
    resources = ["arn:aws:s3:::bucket1*"]
  }
}

data "aws_iam_policy_document" "s3_bucket3_readonly" {
  statement {
    actions   = ["s3:Get*", "s3:List*"]
    effect    = "Allow"
    resources = ["arn:aws:s3:::bucket3*"]
  }
}

data "aws_iam_policy_document" "s3_bucket4_readonly" {
  statement {
    actions   = ["s3:Get*", "s3:List*"]
    effect    = "Allow"
    resources = ["arn:aws:s3:::bucket4*"]
  }
}

resource "aws_iam_policy" "s3_all_readonly" {
  name        = "custom-policies-s3-all-readonly"
  path        = "/"
  description = "Policy for custom-policies role"
  policy      = data.aws_iam_policy_document.s3_all_readonly.json
}

module "role_custom_policies" {
  source              = "JousP/iam-assumeRole/aws"
  version             = "~> 3.1"
  name                = "custom-policies"
  description         = "Custom role with fixed inline and managed policies"
  path                = "/custom/"
  policies            = [aws_iam_policy.s3_all_readonly.arn]
  policies_count      = 1
  json_policies       = [data.aws_iam_policy_document.s3_bucket3_readonly.json]
  json_policies_count = 1
}

resource "aws_iam_role_policy" "role_custom_policies_bucket4" {
  name   = "custom-policies-s3-bucket4-readonly"
  role   = module.role_custom_policies.id
  policy = data.aws_iam_policy_document.s3_bucket4_readonly.json
}

resource "aws_iam_role_policy_attachment" "role_custom_policies_ro" {
  role       = module.role_custom_policies.id
  policy_arn = "arn:aws:iam::aws:policy/ReadOnlyAccess"
}

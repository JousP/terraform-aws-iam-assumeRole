# Generates an IAM policy document
data "aws_iam_policy_document" "role_custom_assumeRole" {
  statement {
    sid     = "CustomAssumeRole"
    actions = ["sts:AssumeRole"]
    principals {
      type        = "Service"
      identifiers = ["ecs.amazonaws.com"]
    }
    effect = "Allow"
  }
}

module "role_custom_assumeRole" {
  source               = "JousP/iam-assumeRole/aws"
  version              = "~> 3.3"
  name                 = "custom-assumeRole"
  description          = "Custom role with customization the assume_role policy"
  assume_role_policy   = data.aws_iam_policy_document.role_custom_assumeRole.json
  path                 = "/custom/"
  max_session_duration = 7200
}


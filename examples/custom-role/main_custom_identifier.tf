## Get the current caller identity
data "aws_caller_identity" "current" {}

module "role_custom_identifier" {
  source               = "JousP/iam-assumeRole/aws"
  version              = "~> 3.1"
  name                 = "custom"
  description          = "Custom role with customization for who can assume it"
  aws_identifiers      = ["arn:aws:iam::${data.aws_caller_identity.current.account_id}:root"]
  service_identifiers  = ["ec2.amazonaws.com"]
  path                 = "/custom/"
  max_session_duration = 7200
}


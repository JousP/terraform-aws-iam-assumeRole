module "role_basic" {
  source              = "JousP/iam-assumeRole/aws"
  version             = "~> 3.2"
  name                = "basic"
  description         = "Basic role that every IAM users in this account can assume to have ReadOnly access"
  managed_policy_arns = ["arn:aws:iam::aws:policy/ReadOnlyAccess"]
}

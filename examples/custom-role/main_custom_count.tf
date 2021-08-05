module "role_custom_count" {
  source              = "JousP/iam-assumeRole/aws"
  version             = "~> 3.3"
  count               = 2
  name                = "custom_count_${count.index}"
  description         = "custom_count_${count.index} role that every IAM users in this account can assume to have ReadOnly access"
  managed_policy_arns = ["arn:aws:iam::aws:policy/ReadOnlyAccess"]
}

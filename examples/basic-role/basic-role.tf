module "role_basic" {
  source         = "JousP/iam-assumeRole/aws"
  version        = "1.0.2"
  name           = "basic"
  description    = "Basic role that every IAM users in this account can assume to have ReadOnly access"
  policies_count = 1
  policies       = ["arn:aws:iam::aws:policy/ReadOnlyAccess"]
}

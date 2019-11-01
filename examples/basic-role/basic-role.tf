module "role_basic" {
  source         = "github.com/JousP/terraform-aws-iam-assumeRole"
  name           = "basic"
  description    = "Basic role that every IAM users in this account can assume to have ReadOnly access"
  policies_count = 1
  policies       = ["arn:aws:iam::aws:policy/ReadOnlyAccess"]
}

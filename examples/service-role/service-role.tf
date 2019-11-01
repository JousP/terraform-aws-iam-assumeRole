module "ec2_role" {
  source         = "github.com/JousP/terraform-aws-iam-assumeRole?ref=v1.0.0"
  name           = "ec2_role"
  description    = "This role can be assumed by the EC2 service to get ReadOnly access to the AWS account."
  service        = "ec2.amazonaws.com"
  policies_count = 1
  policies       = ["arn:aws:iam::aws:policy/ReadOnlyAccess"]
}

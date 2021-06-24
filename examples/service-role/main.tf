module "ec2_role" {
  source              = "JousP/iam-assumeRole/aws"
  version             = "~> 3.2"
  name                = "ec2_role"
  description         = "This role can be assumed by the EC2 service to get ReadOnly access to the AWS account."
  service_identifiers = ["ec2.amazonaws.com"]
  managed_policy_arns = ["arn:aws:iam::aws:policy/ReadOnlyAccess"]
}

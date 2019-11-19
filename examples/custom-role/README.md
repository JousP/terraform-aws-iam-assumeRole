# Custom Role deployment Example
## Description
This example define an 2 IAM roles.  
The first has a custom identifier for the assumeRole policy which allow everyone (from every AWS account) to assume it. For that purpose no policy has been assigned to the role.  
The second role has a full custom assum_role policy which allow the EC2 service to assume it. The role has 2 policies attached.  

## Content
[basic-policy.tf](basic-policy.tf)
```
## Get the current caller identity
data "aws_caller_identity" "current" {
}

# Generates an IAM policy document
data "aws_iam_policy_document" "s3_readonly" {
  statement {
    actions   = ["s3:Get*", "s3:List*"]
    effect    = "Allow"
    resources = ["*"]
  }
}

# Create an IAM policy
resource "aws_iam_policy" "policy" {
  name        = "custom-role"
  path        = "/"
  description = "Policy for custom-role"
  policy      = data.aws_iam_policy_document.s3_readonly.json
}

module "role_custom_identifier" {
  source               = "JousP/iam-assumeRole/aws"
  version              = "2.0.1"
  name                 = "custom"
  description          = "Custom role with customization for who can assume it"
  identifier           = "arn:aws:iam::${data.aws_caller_identity.current.account_id}:root"
  path                 = "/custom/"
  max_session_duration = 7200
}

# Generates an IAM policy document
data "aws_iam_policy_document" "role_custom_assumeRole" {
  statement {
    actions       = ["sts:AssumeRole"]
    principals {
      type        = "Service"
      identifiers = ["ec2.amazonaws.com"]
    }
    effect        = "Allow"
  }
}

module "role_custom_assumeRole" {
  source               = "JousP/iam-assumeRole/aws"
  version              = "2.0.1"
  name                 = "custom-assumeRole"
  description          = "Custom role with customization the assume_role policy"
  assume_role_policy   = data.aws_iam_policy_document.role_custom_assumeRole.json
  path                 = "/custom/"
  max_session_duration = 7200
  permissions_boundary = ""
  policies_count       = 1
  policies             = [aws_iam_policy.policy.arn]
  json_policies        = [data.aws_iam_policy_document.s3_readonly.json]
  tags                 = {
    "Environment"      = "Test"
  }
}
```

## Use the example
Follow these instruction to use this example :  
- Edit the `terraform.tfvars` file
- Optionally edit the `basic-role.tf`
- run `terraform init`
- then you can run `terraform plan` and `terraform apply`

Don't forget to run `terraform destroy` if you were just running tests.
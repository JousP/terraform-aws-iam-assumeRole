# Basic Role deployment Example
## Description
This example define an IAM role named "basic".  
Every IAM user under the account where it's being deployed can assume this role to get ReadOnly access to the AWS account.  

## Content
[basic-policy.tf](basic-policy.tf)
```
module "role_basic" {
  source         = "JousP/iam-assumeRole/aws"
  version        = "2.0.2"
  name           = "basic"
  description    = "Basic role that every IAM users in this account can assume to have ReadOnly access"
  policies_count = 1
  policies       = ["arn:aws:iam::aws:policy/ReadOnlyAccess"]
}
```

## Use the example
Follow these instruction to use this example :  
- Edit the `terraform.tfvars` file
- Optionally edit the `basic-role.tf`
- run `terraform init`
- then you can run `terraform plan` and `terraform apply`

Don't forget to run `terraform destroy` if you were just running tests.
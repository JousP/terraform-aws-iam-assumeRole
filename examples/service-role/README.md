# Service Role deployment Example
## Description
This example define an IAM role named "ec2_role".  
This role can be assumed by the EC2 service to get ReadOnly access to the AWS account.  

## Content
[main.tf](main.tf)
```
module "ec2_role" {
  source              = "JousP/iam-assumeRole/aws"
  version             = "~> 3.1"
  name                = "ec2_role"
  description         = "This role can be assumed by the EC2 service to get ReadOnly access to the AWS account."
  service_identifiers = ["ec2.amazonaws.com"]
  managed_policy_arns = ["arn:aws:iam::aws:policy/ReadOnlyAccess"]
}
```

## Use the example
Follow these instruction to use this example :  
- Edit the `terraform.tfvars` file
- Optionally edit the `main.tf` file
- run `terraform init`
- then you can run `terraform plan` and `terraform apply`

Don't forget to run `terraform destroy` if you were just running tests.

# Service Role deployment Example
## Description
This example define an IAM role named "ec2_role".  
This role can be assumed by the EC2 service to get ReadOnly access to the AWS account.  

## Use the example
Follow these instruction to use this example :  
- Edit the `terraform.tfvars` file
- Optionally edit the `service-role.tf`
- run `terraform init`
- then you can run `terraform plan` and `terraform apply`

Don't forget to run `terraform destroy` if you were just running tests.
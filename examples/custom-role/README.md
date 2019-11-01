# Custom Role deployment Example
## Description
This example define an 2 IAM roles.  
The first has a custom identifier for the assumeRole policy which allow everyone (from every AWS account) to assume it. For that purpose no policy has been assigned to the role.  
The second role has a full custom assum_role policy which allow the EC2 service to assume it. The role has 2 policies attached.  

## Use the example
Follow these instruction to use this example :  
- Edit the `terraform.tfvars` file
- Optionally edit the `basic-role.tf`
- run `terraform init`
- then you can run `terraform plan` and `terraform apply`

Don't forget to run `terraform destroy` if you were just running tests.
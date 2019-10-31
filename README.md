# terraform-aws-iam-assumeRole
This module creates :
- 1 aws_role
- 1 generic "assume_role" policy (if no assume_role_policy attribute provided.)
- And attach every provided policies (ARN or Json) to the role

This module can be used for different purpose such as :
- create a role
- set cross-account access
- create a service role 

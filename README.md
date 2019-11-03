# terraform-aws-iam-assumeRole
This module creates :
- 1 aws_role
- 1 generic "assume_role" policy (if no assume_role_policy attribute provided.)
- And attach every provided policies (ARN or Json) to the role

Policies can be passed in json (json_policies variable) or by their ARN (policies and policies_count variables).
Because we use a count instead of a for_each to associate policies ARN, you need to adjust the `policies_count` variable based on the number of policies ARN provided.

This module can be used for different purpose such as :
- create a role
- set cross-account access
- create a service role 

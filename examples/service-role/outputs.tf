output "ec2_role_arn" {
  description = "The Amazon Resource Name (ARN) specifying the role."
  value       = module.ec2_role.arn
}

output "ec2_role_create_date" {
  description = "The creation date of the IAM role."
  value       = module.ec2_role.create_date
}

output "ec2_role_description" {
  description = "The description of the role."
  value       = module.ec2_role.description
}

output "ec2_role_id" {
  description = "The name of the role."
  value       = module.ec2_role.id
}

output "ec2_role_name" {
  description = "The name of the role."
  value       = module.ec2_role.name
}

output "ec2_role_unique_id" {
  description = "The stable and unique string identifying the role."
  value       = module.ec2_role.unique_id
}


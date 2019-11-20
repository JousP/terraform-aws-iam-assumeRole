output "role_custom_identifier_arn" {
  description = "The Amazon Resource Name (ARN) specifying the role."
  value       = module.role_custom_identifier.arn
}

output "role_custom_identifier_assume_role_policy" {
  description = "(Required) The policy that grants an entity permission to assume the role."
  value       = module.role_custom_identifier.assume_role_policy
}

output "role_custom_identifier_create_date" {
  description = "The creation date of the IAM role."
  value       = module.role_custom_identifier.create_date
}

output "role_custom_identifier_description" {
  description = "The description of the role."
  value       = module.role_custom_identifier.description
}

output "role_custom_identifier_force_detach_policies" {
  description = "(Optional) Specifies to force detaching any policies the role has before destroying it. Defaults to false."
  value       = module.role_custom_identifier.force_detach_policies
}

output "role_custom_identifier_id" {
  description = "The name of the role."
  value       = module.role_custom_identifier.id
}

output "role_custom_identifier_max_session_duration" {
  description = "(Optional) The maximum session duration (in seconds) that you want to set for the specified role. If you do not specify a value for this setting, the default maximum of one hour is applied. This setting can have a value from 1 hour to 12 hours."
  value       = module.role_custom_identifier.max_session_duration
}

output "role_custom_identifier_name" {
  description = "The name of the role."
  value       = module.role_custom_identifier.name
}

output "role_custom_identifier_name_prefix" {
  description = "(Optional, Forces new resource) Creates a unique name beginning with the specified prefix. Conflicts with name."
  value       = module.role_custom_identifier.name_prefix
}

output "role_custom_identifier_path" {
  description = "(Optional) The path to the role. See IAM Identifiers for more information."
  value       = module.role_custom_identifier.path
}

output "role_custom_identifier_permissions_boundary" {
  description = "(Optional) The ARN of the policy that is used to set the permissions boundary for the role."
  value       = module.role_custom_identifier.permissions_boundary
}

output "role_custom_identifier_tags" {
  description = "Key-value mapping of tags for the IAM role"
  value       = module.role_custom_identifier.tags
}

output "role_custom_identifier_unique_id" {
  description = "The stable and unique string identifying the role."
  value       = module.role_custom_identifier.unique_id
}

output "role_custom_identifier_policies_attachment" {
  description = "Managed IAM Policies attached to the IAM role"
  value       = module.role_custom_identifier.policies_attachment
}

output "role_custom_identifier_policies" {
  description = "The role policy ID, in the form of role_name:role_policy_name."
  value       = module.role_custom_identifier.policies
}

output "role_custom_assumeRole_arn" {
  description = "The Amazon Resource Name (ARN) specifying the role."
  value       = module.role_custom_assumeRole.arn
}

output "role_custom_assumeRole_assume_role_policy" {
  description = "(Required) The policy that grants an entity permission to assume the role."
  value       = module.role_custom_assumeRole.assume_role_policy
}

output "role_custom_assumeRole_create_date" {
  description = "The creation date of the IAM role."
  value       = module.role_custom_assumeRole.create_date
}

output "role_custom_assumeRole_description" {
  description = "The description of the role."
  value       = module.role_custom_assumeRole.description
}

output "role_custom_assumeRole_force_detach_policies" {
  description = "(Optional) Specifies to force detaching any policies the role has before destroying it. Defaults to false."
  value       = module.role_custom_assumeRole.force_detach_policies
}

output "role_custom_assumeRole_id" {
  description = "The name of the role."
  value       = module.role_custom_assumeRole.id
}

output "role_custom_assumeRole_max_session_duration" {
  description = "(Optional) The maximum session duration (in seconds) that you want to set for the specified role. If you do not specify a value for this setting, the default maximum of one hour is applied. This setting can have a value from 1 hour to 12 hours."
  value       = module.role_custom_assumeRole.max_session_duration
}

output "role_custom_assumeRole_name" {
  description = "The name of the role."
  value       = module.role_custom_assumeRole.name
}

output "role_custom_assumeRole_name_prefix" {
  description = "(Optional, Forces new resource) Creates a unique name beginning with the specified prefix. Conflicts with name."
  value       = module.role_custom_assumeRole.name_prefix
}

output "role_custom_assumeRole_path" {
  description = "(Optional) The path to the role. See IAM Identifiers for more information."
  value       = module.role_custom_assumeRole.path
}

output "role_custom_assumeRole_permissions_boundary" {
  description = "(Optional) The ARN of the policy that is used to set the permissions boundary for the role."
  value       = module.role_custom_assumeRole.permissions_boundary
}

output "role_custom_assumeRole_tags" {
  description = "Key-value mapping of tags for the IAM role"
  value       = module.role_custom_assumeRole.tags
}

output "role_custom_assumeRole_unique_id" {
  description = "The stable and unique string identifying the role."
  value       = module.role_custom_assumeRole.unique_id
}

output "role_custom_assumeRole_policies_attachment" {
  description = "Managed IAM Policies attached to the IAM role"
  value       = module.role_custom_assumeRole.policies_attachment
}

output "role_custom_assumeRole_policies" {
  description = "The role policy ID, in the form of role_name:role_policy_name."
  value       = module.role_custom_assumeRole.policies
}

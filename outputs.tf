output "assume_role_policy" {
  description = "Policy that grants an entity permission to assume the role."
  value       = aws_iam_role.role.assume_role_policy
}

output "description" {
  description = "Description of the role."
  value       = aws_iam_role.role.description
}

output "force_detach_policies" {
  description = "Whether to force detaching any policies the role has before destroying it. Defaults to false."
  value       = aws_iam_role.role.force_detach_policies
}

output "inline_policy" {
  description = "Configuration block defining an exclusive set of IAM inline policies associated with the IAM role. Defined below. If no blocks are configured, Terraform will ignore any managing any inline policies in this resource. Configuring one empty block (i.e., inline_policy {}) will cause Terraform to remove all inline policies."
  value       = aws_iam_role.role.inline_policy
}

output "managed_policy_arns" {
  description = "Set of exclusive IAM managed policy ARNs to attach to the IAM role. If this attribute is not configured, Terraform will ignore policy attachments to this resource. When configured, Terraform will align the role's managed policy attachments with this set by attaching or detaching managed policies. Configuring an empty set (i.e., managed_policy_arns = []) will cause Terraform to remove all managed policy attachments."
  value       = aws_iam_role.role.managed_policy_arns
}

output "max_session_duration" {
  description = "Maximum session duration (in seconds) that you want to set for the specified role. If you do not specify a value for this setting, the default maximum of one hour is applied. This setting can have a value from 1 hour to 12 hours."
  value       = aws_iam_role.role.max_session_duration
}

output "name_prefix" {
  description = "Creates a unique friendly name beginning with the specified prefix. Conflicts with name."
  value       = aws_iam_role.role.name_prefix
}

output "path" {
  description = "Path to the role. See IAM Identifiers for more information."
  value       = aws_iam_role.role.path
}

output "permissions_boundary" {
  description = "ARN of the policy that is used to set the permissions boundary for the role."
  value       = aws_iam_role.role.permissions_boundary
}

output "tags" {
  description = "Key-value mapping of tags for the IAM role. If configured with a provider default_tags configuration block present, tags with matching keys will overwrite those defined at the provider-level."
  value       = aws_iam_role.role.tags
}

output "arn" {
  description = "Amazon Resource Name (ARN) specifying the role."
  value       = aws_iam_role.role.arn
}

output "create_date" {
  description = "Creation date of the IAM role."
  value       = aws_iam_role.role.create_date
}

output "id" {
  description = "Name of the role."
  value       = aws_iam_role.role.id
}

output "name" {
  description = "Name of the role."
  value       = aws_iam_role.role.name
}

output "tags_all" {
  description = "A map of tags assigned to the resource, including those inherited from the provider default_tags configuration block."
  value       = aws_iam_role.role.tags_all
}

output "unique_id" {
  description = "Stable and unique string identifying the role."
  value       = aws_iam_role.role.unique_id
}


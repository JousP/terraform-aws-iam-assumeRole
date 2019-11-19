# Role
output "arn" {
  description = "The Amazon Resource Name (ARN) specifying the role."
  value       = "${element(concat(aws_iam_role.role.*.arn, list("")), 0)}"
}

output "assume_role_policy" {
  description = "(Required) The policy that grants an entity permission to assume the role."
  value       = "${element(concat(aws_iam_role.role.*.assume_role_policy, list("")), 0)}"
}

output "create_date" {
  description = "The creation date of the IAM role."
  value       = "${element(concat(aws_iam_role.role.*.create_date, list("")), 0)}"
}

output "description" {
  description = "The description of the role."
  value       = "${element(concat(aws_iam_role.role.*.description, list("")), 0)}"
}

output "force_detach_policies" {
  description = "(Optional) Specifies to force detaching any policies the role has before destroying it. Defaults to false."
  value       = "${element(concat(aws_iam_role.role.*.force_detach_policies, list("")), 0)}"
}

output "id" {
  description = "The name of the role."
  value       = "${element(concat(aws_iam_role.role.*.id, list("")), 0)}"
}

output "max_session_duration" {
  description = "(Optional) The maximum session duration (in seconds) that you want to set for the specified role. If you do not specify a value for this setting, the default maximum of one hour is applied. This setting can have a value from 1 hour to 12 hours."
  value       = "${element(concat(aws_iam_role.role.*.max_session_duration, list("")), 0)}"
}

output "name" {
  description = "The name of the role."
  value       = "${element(concat(aws_iam_role.role.*.name, list("")), 0)}"
}

# output "name_prefix" {
#   description = "(Optional, Forces new resource) Creates a unique name beginning with the specified prefix. Conflicts with name."
#   value       = "${element(concat(aws_iam_role.role.*.name_prefix, list("")), 0)}"
# }

output "path" {
  description = "(Optional) The path to the role. See IAM Identifiers for more information."
  value       = "${element(concat(aws_iam_role.role.*.path, list("")), 0)}"
}

# output "permissions_boundary" {
#   description = "(Optional) The ARN of the policy that is used to set the permissions boundary for the role."
#   value       = "${element(concat(aws_iam_role.role.*.permissions_boundary, list("")), 0)}"
# }

# output "tags" {
#   description = "Key-value mapping of tags for the IAM role"
#   value       = "${element(concat(aws_iam_role.role.*.tags, list("")), 0)}"
# }

output "unique_id" {
  description = "The stable and unique string identifying the role."
  value       = "${element(concat(aws_iam_role.role.*.unique_id, list("")), 0)}"
}

output "policies_attachment" {
  description = "Managed IAM Policies attached to the IAM role"
  value       = "${var.policies}"
}

output "policies_id" {
  description = "The role policy ID, in the form of role_name:role_policy_name."
  value       = "${aws_iam_role_policy.role.*.id}"
}

output "policies_name" {
  description = "The name of the policy."
  value       = "${aws_iam_role_policy.role.*.name}"
}

output "policies_policy" {
  description = "The policy document attached to the role."
  value       = "${aws_iam_role_policy.role.*.policy}"
}

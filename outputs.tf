# Role
output "arn" {
  description = "The Amazon Resource Name (ARN) specifying the role."
  value       = element(concat(aws_iam_role.role.*.arn, [""]), 0)
}

output "create_date" {
  description = "The creation date of the IAM role."
  value       = element(concat(aws_iam_role.role.*.create_date, [""]), 0)
}

output "description" {
  description = "The description of the role."
  value       = element(concat(aws_iam_role.role.*.description, [""]), 0)
}

output "id" {
  description = "The name of the role."
  value       = element(concat(aws_iam_role.role.*.id, [""]), 0)
}

output "name" {
  description = "The name of the role."
  value       = element(concat(aws_iam_role.role.*.name, [""]), 0)
}

output "unique_id" {
  description = "The stable and unique string identifying the role."
  value       = element(concat(aws_iam_role.role.*.unique_id, [""]), 0)
}


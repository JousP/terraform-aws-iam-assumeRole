output "role_basic_arn" {
  description = "The Amazon Resource Name (ARN) specifying the role."
  value       = "${module.role_basic.arn}"
}

output "role_basic_create_date" {
  description = "The creation date of the IAM role."
  value       = "${module.role_basic.create_date}"
}

output "role_basic_description" {
  description = "The description of the role."
  value       = "${module.role_basic.description}"
}

output "role_basic_id" {
  description = "The name of the role."
  value       = "${module.role_basic.id}"
}

output "role_basic_name" {
  description = "The name of the role."
  value       = "${module.role_basic.name}"
}

output "role_basic_unique_id" {
  description = "The stable and unique string identifying the role."
  value       = "${module.role_basic.unique_id}"
}

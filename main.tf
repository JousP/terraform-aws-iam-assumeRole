## Get the current caller identity
data "aws_caller_identity" "current" {
}

## local variable to define the assumeRole policy to attach to the role
locals {
  aws_identifier         = {
    type                 = "AWS"
    identifiers          = length(var.aws_identifiers) == 0 ? ["arn:aws:iam::${data.aws_caller_identity.current.account_id}:root"] : var.aws_identifiers
  }
  service_identifier     = {
    type                 = "Service"
    identifiers          = var.service_identifiers
  }
  assume_role_policy     = var.assume_role_policy == "" ? data.aws_iam_policy_document.iam_assumeRole_generic.json : var.assume_role_policy
  assume_role_principals = length(var.service_identifiers) == 0 ? list(local.aws_identifier) : length(var.aws_identifiers) == 0 ? list(local.service_identifier) : list(local.aws_identifier, local.service_identifier)
}

# Generates an IAM policy document
data "aws_iam_policy_document" "iam_assumeRole_generic" {
  policy_id         = "AssumeRole"
  statement {
    sid             = "AllowAssumeRole"
    actions         = ["sts:AssumeRole"]
    dynamic "principals" {
      for_each      = local.assume_role_principals
      content {
        type        = principals.value["type"]
        identifiers = principals.value["identifiers"]
      }
    }
    effect          = "Allow"
  }
}

# Create the IAM role
resource "aws_iam_role" "role" {
  count                 = var.enabled ? 1 : 0
  name                  = var.name
  assume_role_policy    = local.assume_role_policy
  description           = var.description
  path                  = var.path
  force_detach_policies = var.force_detach_policies
  max_session_duration  = var.max_session_duration
  permissions_boundary  = var.permissions_boundary
  tags                  = var.tags
}

# Attach provided policies to the role
resource "aws_iam_role_policy_attachment" "role" {
  # The "for_each" value depends on resource attributes that cannot be determined
  # until apply, so Terraform cannot predict how many instances will be created.
  # for_each   = toset(var.enabled ? var.policies : [])
  # policy_arn = each.key
  count      = var.enabled ? var.policies_count : 0
  role       = aws_iam_role.role[0].name
  policy_arn = element(var.policies, count.index)
}

# Attach provided inline policies to the role
resource "aws_iam_role_policy" "role" {
  # The "for_each" value depends on resource attributes that cannot be determined
  # until apply, so Terraform cannot predict how many instances will be created.
  # for_each = toset(var.enabled ? var.json_policies : [])
  # policy   = each.key
  count  = var.enabled ? var.json_policies_count : 0
  role   = aws_iam_role.role[0].name
  name   = "${var.name}-${count.index}"
  policy = element(var.json_policies, count.index)
}

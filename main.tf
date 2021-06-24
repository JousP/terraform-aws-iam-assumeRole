## Get the current caller identity
data "aws_caller_identity" "current" {
}

## local variable to define the assumeRole policy to attach to the role
locals {
  aws_identifier = length(var.service_identifiers) > 0 && length(var.aws_identifiers) == 0 ? [] : [{
    type        = "AWS"
    identifiers = coalescelist(var.aws_identifiers, ["arn:aws:iam::${data.aws_caller_identity.current.account_id}:root"])
  }]
  service_identifier = length(var.service_identifiers) == 0 ? [] : [{
    type        = "Service"
    identifiers = var.service_identifiers
  }]
}

# Generates an IAM policy document
data "aws_iam_policy_document" "iam_assumeRole_generic" {
  policy_id = "AssumeRole"
  statement {
    sid     = "AllowAssumeRole"
    actions = ["sts:AssumeRole"]
    dynamic "principals" {
      for_each = local.aws_identifier
      content {
        type        = principals.value["type"]
        identifiers = principals.value["identifiers"]
      }
    }
    dynamic "principals" {
      for_each = local.service_identifier
      content {
        type        = principals.value["type"]
        identifiers = principals.value["identifiers"]
      }
    }
    effect = "Allow"
  }
}

# Create the IAM role
resource "aws_iam_role" "role" {
  assume_role_policy    = coalesce(var.assume_role_policy, data.aws_iam_policy_document.iam_assumeRole_generic.json)
  description           = var.description
  force_detach_policies = var.force_detach_policies
  dynamic "inline_policy" {
    for_each = var.inline_policy
    content {
      name   = inline_policy.value["name"]
      policy = inline_policy.value["policy"]
    }
  }
  managed_policy_arns  = var.managed_policy_arns
  max_session_duration = var.max_session_duration
  name                 = var.name
  name_prefix          = var.name_prefix
  path                 = var.path
  permissions_boundary = var.permissions_boundary
  tags                 = var.tags
}

# Attach provided policies to the role
resource "aws_iam_role_policy_attachment" "role" {
  # The "for_each" value depends on resource attributes that cannot be determined
  # until apply, so Terraform cannot predict how many instances will be created.
  # for_each   = toset(var.policies)
  # policy_arn = each.key
  count      = var.policies_count
  role       = aws_iam_role.role.name
  policy_arn = element(var.policies, count.index)
}

# Attach provided inline policies to the role
resource "aws_iam_role_policy" "role" {
  # The "for_each" value depends on resource attributes that cannot be determined
  # until apply, so Terraform cannot predict how many instances will be created.
  # for_each = toset(var.json_policies)
  # policy   = each.key
  count  = var.json_policies_count
  role   = aws_iam_role.role.name
  name   = "${var.name}-${count.index}"
  policy = element(var.json_policies, count.index)
}

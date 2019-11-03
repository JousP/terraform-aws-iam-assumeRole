## Get the current caller identity
data "aws_caller_identity" "current" {
}

## local variable to define the assumeRole policy to attach to the role
locals {
  identifier              = var.identifier == "" ? "arn:aws:iam::${data.aws_caller_identity.current.account_id}:root" : var.identifier
  assume_role_policy      = var.assume_role_policy == "" ? data.aws_iam_policy_document.iam_assumeRole_generic.json : var.assume_role_policy
  assume_role_type        = var.service == "" ? "AWS" : "Service"
  assume_role_identifiers = var.service == "" ? local.identifier : var.service
}

# Generates an IAM policy document
data "aws_iam_policy_document" "iam_assumeRole_generic" {
  policy_id       = "AssumeRole"
  statement {
    sid           = "AllowAssumeRole"
    actions       = ["sts:AssumeRole"]
    principals {
      type        = local.assume_role_type
      identifiers = [local.assume_role_identifiers]
    }
    effect        = "Allow"
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
  for_each = toset(var.enabled ? var.json_policies : [])
  name     = "${var.name}-policy"
  # can we remove [0] ?
  role     = aws_iam_role.role[0].name
  policy   = each.key
}


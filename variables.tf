# Role
variable "assume_role_policy" {
  description = "(Optional) Specific policy to assume that role, if not whole account required."
  type        = string
  default     = null
}

variable "description" {
  description = "(Optional) The description of the role."
  type        = string
  default     = null
}

variable "force_detach_policies" {
  description = "(Optional) Specifies to force detaching any policies the role has before destroying it. Defaults to true."
  type        = bool
  default     = null
}

variable "inline_policy" {
  description = "(Optional) Configuration block defining an exclusive set of IAM inline policies associated with the IAM role. Defined below. If no blocks are configured, Terraform will ignore any managing any inline policies in this resource. Configuring one empty block (i.e., inline_policy {}) will cause Terraform to remove all inline policies."
  type = list(object({
    name   = string
    policy = string
  }))
  default = []
}

variable "managed_policy_arns" {
  description = "(Optional) Set of exclusive IAM managed policy ARNs to attach to the IAM role. If this attribute is not configured, Terraform will ignore policy attachments to this resource. When configured, Terraform will align the role's managed policy attachments with this set by attaching or detaching managed policies. Configuring an empty set (i.e., managed_policy_arns = []) will cause Terraform to remove all managed policy attachments."
  type        = list(string)
  default     = null
}

variable "max_session_duration" {
  description = "(Optional) The maximum session duration (in seconds) that you want to set for the specified role. If you do not specify a value for this setting, the default maximum of one hour is applied. This setting can have a value from 1 hour to 12 hours."
  type        = number
  default     = null
}

variable "name" {
  description = "(Optional) The name of the role."
  type        = string
  default     = null
}

variable "name_prefix" {
  description = "(Optional, Forces new resource) Creates a unique friendly name beginning with the specified prefix. Conflicts with name."
  type        = string
  default     = null
}

variable "path" {
  description = "(Optional) The path to the role."
  type        = string
  default     = null
}

variable "permissions_boundary" {
  description = "(Optional) The ARN of the policy that is used to set the permissions boundary for the role."
  type        = string
  default     = null
}

variable "tags" {
  description = "Key-value mapping of tags for the IAM role"
  type        = map(string)
  default     = {}
}

variable "policies_count" {
  description = "(Optional) Number of AWS policies provided in the `policies` variable"
  type        = number
  default     = 0
}

variable "policies" {
  description = "(Optional) The ARNs of policies to directly attach to the role"
  type        = list(string)
  default     = []
}

variable "json_policies_count" {
  description = "(Optional) Number of JSON formatted inline policies provided in the `json_policies` variable"
  type        = number
  default     = 0
}

variable "json_policies" {
  description = "(Optional) The JSON formatted inline policies for the role"
  type        = list(string)
  default     = []
}

# AssumeRole Default Policy Customization
variable "aws_identifiers" {
  description = "(Optional) list of Identifiers for principal of type \"AWS\", these are IAM user or role ARNs."
  type        = list(string)
  default     = []
}

variable "service_identifiers" {
  description = "(Optional) list of Identifiers for principal of type \"Service\", these are AWS service eg. lambda.amazonaws.com."
  type        = list(string)
  default     = []
}

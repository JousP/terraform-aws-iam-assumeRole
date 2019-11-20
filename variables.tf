# Role
variable "name" {
  description = "(Required) The name of the role."
  type        = string
}

variable "description" {
  description = "(Required) The description of the role."
  type        = string
}

variable "assume_role_policy" {
  description = "(Optional) Specific policy to assume that role, if not whole account required."
  type        = string
  default     = ""
}

variable "force_detach_policies" {
  description = "(Optional) Specifies to force detaching any policies the role has before destroying it. Defaults to true."
  default     = true
}

variable "path" {
  description = "(Optional) The path to the role."
  type        = string
  default     = "/"
}

variable "max_session_duration" {
  description = "(Optional) The maximum session duration (in seconds) that you want to set for the specified role. If you do not specify a value for this setting, the default maximum of one hour is applied. This setting can have a value from 1 hour to 12 hours."
#  type        = string
#  default     = "3600"
  type        = number
  default     = 3600
}

variable "permissions_boundary" {
  description = "(Optional) The ARN of the policy that is used to set the permissions boundary for the role."
  type        = string
  default     = ""
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
variable "identifier" {
  description = "(Optional) Identifier for principal. When type is \"AWS\", these are IAM user or role ARNs. When type is \"Service\", these are AWS Service roles e.g. lambda.amazonaws.com."
  type        = string
  default     = ""
}

variable "service" {
  description = "(Optional) the AWS service FQDN for service Role"
  type        = string
  default     = ""
}

# Avoid resources creation
variable "enabled" {
  description = "(Optional) Whether resources have to be deployed"
  type        = bool
  default     = true
}


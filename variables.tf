variable "name" {
  type        = string
  description = "Name of the AWS RAM Resource Share"
}

variable "allow_external_principals" {
  type        = bool
  default     = false
  description = "Indicates whether principals outside your organization can be associated with the AWS RAM Resource Share"
}

variable "permission_arns" {
  type        = set(string)
  default     = null
  description = "Specifies the Amazon Resource Names (ARNs) of the RAM permission to associate with the AWS RAM Resource Share. If you do not specify an ARN for the permission, AWS RAM automatically attaches the default version of the permission for each resource type."
}

variable "principals" {
  type        = map(string)
  default     = {}
  description = "A map of keys to AWS Principals (Account ID's, OUs) to associate with the AWS RAM Resource Share"
}

variable "shared_resource_arns" {
  type        = map(string)
  description = "A map of keys to Resource ARNs to associate with the AWS RAM Resource Share"
}
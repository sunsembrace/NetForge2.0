variable "role_name" {
  description = "Name of the IAM role"
  type        = string
}

variable "assume_role_policy" {
  description = "The JSON policy that grants an entity permission to assume the role"
  type        = string
}

variable "managed_policy_arns" {
  description = "List of ARNs of managed policies to attach to the role"
  type        = list(string)
  default     = []
}

variable "project_tag" {
  description = "Project tag for resource tagging"
  type        = string
}

variable "environment" {
  description = "Environment tag for resource tagging"
  type        = string
}

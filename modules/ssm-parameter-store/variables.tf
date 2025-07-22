variable "parameters" {
  description = "List of SSM parameters to create"
  type = list(object({
    name        = string
    value       = string
    type        = string     # Must be one of: SecureString, String, or StringList
    description = string
  }))
}

variable "project_tag" {
  description = "Project name (e.g., NetForge)"
  type        = string
}

variable "environment" {
  description = "Environment (e.g., dev, prod)"
  type        = string
}

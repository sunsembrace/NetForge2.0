variable "name" {
  description = "The name of the SSM parameter"
  type        = string
}

variable "description" {
  description = "Description of the SSM parameter"
  type        = string
  default     = ""
}

variable "type" {
  description = "Type of the SSM parameter (String, SecureString, StringList)"
  type        = string
  default     = "String"
}

variable "value" {
  description = "Value of the SSM parameter"
  type        = string
  sensitive   = true
}

variable "kms_key_id" {
  description = "KMS Key ID for SecureString encryption, leave empty if not applicable"
  type        = string
  default     = ""
}

variable "environment" {
  description = "Deployment environment tag (e.g. dev, prod)"
  type        = string
}

variable "project_tag" {
  description = "Project tag for resource identification"
  type        = string
}

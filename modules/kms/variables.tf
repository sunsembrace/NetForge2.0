variable "alias_name" {
  description = "Alias name for the KMS key (do not include 'alias/' prefix)"
  type        = string
}

variable "description" {
  description = "Description of the KMS key"
  type        = string
  default     = "KMS key for encryption"
}

variable "deletion_window_in_days" {
  description = "Number of days before KMS key is deleted after destruction"
  type        = number
  default     = 30
}

variable "enable_key_rotation" {
  description = "Enable automatic key rotation"
  type        = bool
  default     = true
}

variable "project_tag" {
  description = "Tag to identify the project"
  type        = string
}

variable "environment" {
  description = "Tag to identify the environment (e.g., dev, staging, prod)"
  type        = string
}

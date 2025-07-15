variable "vpc_cidr" {
  type        = string
  description = "CIDR block for the VPC"
}

variable "name_prefix" {
  description = "Prefix used for naming resources"
  type        = string
}

variable "project_tag" {
  description = "Project tag to identify which project the resources belong to"
  type        = string
}

variable "environment" {
  description = "Environment tag (e.g., dev, staging, prod)"
  type        = string
}

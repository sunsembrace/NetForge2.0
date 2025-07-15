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

variable "public_subnet_ids" {
  type        = list(string)
  description = "List of public subnet IDs where NAT Gateways will be placed"
}

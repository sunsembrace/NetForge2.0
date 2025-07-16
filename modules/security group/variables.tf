variable "vpc_id" {
  description = "VPC ID where the security group will be created"
  type        = string
}

variable "vpc_cidr" {
  description = "CIDR block of the VPC"
  type        = string
}

variable "name_prefix" {
  description = "Prefix to use for resource names"
  type        = string
}

variable "project_tag" {
  description = "Project tag for identifying resources"
  type        = string
}

variable "environment" {
  description = "Environment name (e.g., dev, staging, prod)"
  type        = string
}

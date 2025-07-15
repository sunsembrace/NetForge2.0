variable "vpc_id" {
  description = "The VPC ID where subnets will be created"
  type        = string
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

variable "private_subnet_cidrs" {
  description = "List of CIDR blocks for private subnets"
  type        = list(string)
}

variable "public_subnet_cidrs" {
  description = "List of CIDR blocks for public subnets"
  type        = list(string)
  default     = []
}

variable "availability_zones" {
  description = "List of AZs where subnets will be created"
  type        = list(string)
}

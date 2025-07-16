# General Tagging
variable "name_prefix" {
  description = "Prefix used for naming AWS resources"
  type        = string
}

variable "project_tag" {
  description = "Project name for tagging"
  type        = string
}

variable "environment" {
  description = "Environment name for tagging (e.g. dev, staging, prod)"
  type        = string
}

# VPC
variable "vpc_cidr" {
  description = "CIDR block for the VPC"
  type        = string
}

# Subnets
variable "availability_zones" {
  description = "List of availability zones to use"
  type        = list(string)
}

variable "private_subnet_cidrs" {
  description = "List of CIDR blocks for private subnets"
  type        = list(string)
}

variable "public_subnet_cidrs" {
  description = "List of CIDR blocks for public subnets"
  type        = list(string)
}

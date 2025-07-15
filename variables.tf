# VPC
variable "vpc_cidr" {
  type        = string
  description = "CIDR block for the VPC"
}

variable "name_prefix" {
  type        = string
  description = "Common name prefix for resources"
}

# Subnets
variable "availability_zones" {
  type        = list(string)
  description = "AZs to deploy subnets in"
}

variable "private_subnet_cidrs" {
  type        = list(string)
  description = "CIDR blocks for private subnets"
}

variable "public_subnet_cidrs" {
  type        = list(string)
  description = "CIDR blocks for public subnets"
}


variable "name_prefix" {
  type    = string
  default = "netforge"
}

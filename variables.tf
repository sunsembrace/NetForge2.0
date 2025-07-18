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

#EC2
variable "ami_id" {
  type        = string
  description = "AMI ID for the EC2 instance"
}

variable "instance_type" {
  type        = string
  description = "Instance type for the EC2 instance"
}

variable "instance_name" {
  type        = string
  description = "Name suffix for the EC2 instance"
}

variable "iam_instance_profile_name" {
  type        = string
  description = "Name of the IAM instance profile"
}

#EC2 Security group - Might need tweaking later. 
variable "ec2_sg_name_prefix" {
  description = "Prefix for the EC2 security group"
  type        = string
}

variable "ec2_sg_description" {
  description = "Description for the EC2 security group"
  type        = string
}

variable "vpc_id" {
  description = "VPC ID to use"
  type        = string
}

variable "common_tags" {
  description = "Tags to apply to all resources"
  type        = map(string)
}

variable "ec2_ingress_rules" {
  description = "Ingress rules for EC2 SG"
  type = list(object({
    from_port        = number
    to_port          = number
    protocol         = string
    cidr_blocks      = optional(list(string))
    ipv6_cidr_blocks = optional(list(string))
    security_groups  = optional(list(string))
    description      = optional(string)
  }))
}

variable "ec2_egress_rules" {
  description = "Egress rules for EC2 SG"
  type = list(object({
    from_port        = number
    to_port          = number
    protocol         = string
    cidr_blocks      = optional(list(string))
    ipv6_cidr_blocks = optional(list(string))
    security_groups  = optional(list(string))
    description      = optional(string)
  }))
}

#RDS Security group. 
variable "rds_sg_name_prefix" {
  type        = string
  description = "Prefix for the RDS security group name"
}

variable "rds_sg_description" {
  type        = string
  description = "Description for the RDS security group"
  default     = "Managed by Terraform"
}

variable "rds_ingress_rules" {
  type = list(object({
    from_port        = number
    to_port          = number
    protocol         = string
    cidr_blocks      = optional(list(string))
    ipv6_cidr_blocks = optional(list(string))
    security_groups  = optional(list(string))
    description      = optional(string)
  }))
  default = []
}

variable "rds_egress_rules" {
  type = list(object({
    from_port        = number
    to_port          = number
    protocol         = string
    cidr_blocks      = optional(list(string))
    ipv6_cidr_blocks = optional(list(string))
    security_groups  = optional(list(string))
    description      = optional(string)
  }))
  default = []
}

#RDS 
variable "name_prefix" {
  type        = string
  description = "Prefix used across resources"
}

variable "db_name" {
  type        = string
  description = "Database name"
}

variable "db_username" {
  type        = string
  description = "Database master username"
  sensitive   = true
}

variable "db_password" {
  type        = string
  description = "Database master password"
  sensitive   = true
}

variable "engine_version" {
  type        = string
  default     = "15.4"
  description = "PostgreSQL engine version"
}

variable "instance_class" {
  type        = string
  default     = "db.t3.micro"
  description = "Instance type for the RDS instance"
}

variable "allocated_storage" {
  type        = number
  default     = 20
  description = "Initial DB storage in GB"
}

variable "max_allocated_storage" {
  type        = number
  default     = 100
  description = "Max autoscaled storage in GB"
}

variable "project_tag" {
  type        = string
  description = "Tag to identify the project"
}

variable "environment" {
  type        = string
  description = "Deployment environment"
}

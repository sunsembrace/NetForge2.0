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

variable "subnet_ids" {
  description = "List of subnet IDs to use for RDS subnet group"
  type        = list(string)
}

variable "security_group_ids" {
  description = "List of security group IDs attached to RDS instance"
  type        = list(string)
}

variable "engine" {
  description = "The database engine to use (e.g., postgres, mysql)"
  type        = string
}

variable "engine_version" {
  description = "RDS engine version"
  type        = string
}

variable "instance_class" {
  description = "RDS instance type"
  type        = string
}

variable "allocated_storage" {
  description = "Allocated storage size (GB)"
  type        = number
}

variable "max_allocated_storage" {
  description = "Maximum storage size (GB)"
  type        = number
}

variable "storage_type" {
  description = "Storage type (gp2, gp3, etc.)"
  type        = string
}

variable "db_name" {
  description = "Database name"
  type        = string
}

variable "db_username" {
  description = "Master username"
  type        = string
  sensitive   = true
}

variable "db_password" {
  description = "Master password"
  type        = string
  sensitive   = true
}

variable "multi_az" {
  description = "Deploy multi-AZ RDS instance"
  type        = bool
}

variable "publicly_accessible" {
  description = "Make RDS publicly accessible"
  type        = bool
}

variable "deletion_protection" {
  description = "Enable deletion protection"
  type        = bool
}

variable "skip_final_snapshot" {
  description = "Skip final snapshot when deleting"
  type        = bool
}

variable "apply_immediately" {
  description = "Apply changes immediately"
  type        = bool
}

variable "backup_retention_period" {
  description = "Backup retention in days"
  type        = number
}

#SSM Parameter
variable "parameters" {
  description = "List of SSM parameters to provision"
  type = list(object({
    name        = string
    value       = string
    type        = string     # String, SecureString, StringList
    description = string
  }))
}

#IAM ROLE. 
variable "role_name" {
  description = "Name of the IAM role"
  type        = string
  default     = "netforge2-ec2-role"
}

variable "assume_role_policy_json" {
  description = "JSON string of the IAM assume role policy document"
  type        = string
}

variable "managed_policy_arns" {
  description = "List of managed policy ARNs to attach to the IAM role"
  type        = list(string)
  default = [
    "arn:aws:iam::aws:policy/AmazonEC2ReadOnlyAccess",
    "arn:aws:iam::aws:policy/AmazonSSMManagedInstanceCore"
  ]
}

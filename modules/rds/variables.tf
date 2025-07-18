variable "name_prefix" {
  description = "Prefix for RDS resources (e.g. project name)"
  type        = string
}

variable "subnet_ids" {
  description = "List of private subnet IDs for RDS subnet group"
  type        = list(string)
}

variable "security_group_ids" {
  description = "List of security group IDs to associate with RDS"
  type        = list(string)
}

variable "engine" {
  description = "The database engine to use (e.g., postgres, mysql)"
  type        = string
}

variable "engine_version" {
  description = "Version of the database engine"
  type        = string
}

variable "instance_class" {
  description = "RDS instance class (e.g., db.t3.micro)"
  type        = string
}

variable "allocated_storage" {
  description = "Initial size of DB (in GB)"
  type        = number
}

variable "max_allocated_storage" {
  description = "Maximum storage threshold"
  type        = number
}

variable "storage_type" {
  description = "Storage type for RDS (e.g., gp3)"
  type        = string
}

variable "db_name" {
  description = "Name of the database to create"
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
  description = "Whether to deploy in multiple AZs"
  type        = bool
}

variable "publicly_accessible" {
  description = "Whether the RDS instance should have a public IP"
  type        = bool
}

variable "deletion_protection" {
  description = "Prevents DB deletion when true"
  type        = bool
}

variable "skip_final_snapshot" {
  description = "Skip final snapshot on deletion"
  type        = bool
}

variable "apply_immediately" {
  description = "Apply changes immediately"
  type        = bool
}

variable "backup_retention_period" {
  description = "Retention period for automatic backups (in days)"
  type        = number
}

variable "project_tag" {
  description = "Project name for tagging"
  type        = string
}

variable "environment" {
  description = "Deployment environment (e.g., dev, staging, prod)"
  type        = string
}

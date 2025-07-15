variable "ami_id" {
  type        = string
  description = "AMI ID to use for the EC2 instance (e.g., Amazon Linux 2)"
}

variable "instance_type" {
  type        = string
  default     = "t3.micro"
  description = "EC2 instance type"
}

variable "subnet_id" {
  type        = string
  description = "Private subnet ID to launch the instance in"
}

variable "security_group_ids" {
  type        = list(string)
  description = "List of security group IDs to attach to the instance"
}

variable "iam_instance_profile_name" {
  type        = string
  description = "Name of IAM instance profile that includes SSM permissions"
}

variable "name_prefix" {
  type        = string
  description = "Prefix for resource names (e.g., netforge)"
}

variable "instance_name" {
  type        = string
  description = "Unique identifier for this EC2 instance (e.g., admin-instance)"
}

variable "project_tag" {
  type        = string
  description = "Project tag for cost tracking"
}

variable "environment" {
  type        = string
  description = "Deployment environment (e.g., dev, prod)"
}

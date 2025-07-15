resource "aws_vpc" "main" {
  cidr_block           = var.vpc_cidr
  enable_dns_hostnames = true # Gives private EC2 instances internal DNS hostnames (required for SSM, RDS, etc.)
  enable_dns_support   = true # Enables DNS resolution inside the VPC (used for internal AWS service lookups)

  tags = {
  Name        = "${var.name_prefix}-vpc"
  Project     = var.project_tag
  Environment = var.environment
 }
}
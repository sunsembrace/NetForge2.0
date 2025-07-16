# General Tagging
name_prefix  = "netforge"
project_tag  = "netforge"
environment  = "dev"

# VPC
vpc_cidr = "10.0.0.0/16"

# Subnets
availability_zones     = ["eu-west-2a", "eu-west-2b"]
private_subnet_cidrs   = ["10.0.1.0/24", "10.0.2.0/24"]
public_subnet_cidrs    = ["10.0.101.0/24", "10.0.102.0/24"]


#Nothing NAT Gateway - for public subnmet IDs - They're not manually set. 


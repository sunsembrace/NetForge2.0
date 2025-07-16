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

#EC2 
# NEED TO EC2 BC WE MESSED UP THE TERRAFORM.TFVARS WHEN DOING SECURITY GROUPS??? i feel dumb so basic.
ami_id                    = "ami-0123456789abcdef0"          # Replace with your AMI ID
instance_type             = "t3.micro"
name_prefix               = "netforge"
instance_name             = "private-ec2"
project_tag               = "my-project"
environment               = "dev"
iam_instance_profile_name = "my-iam-instance-profile"

#SECURITY GROUP
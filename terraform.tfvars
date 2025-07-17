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
instance_name             = "private-ec2"
iam_instance_profile_name = "my-iam-instance-profile"

#SECURITY GROUP - Might need tweaking later. 
# Name prefix for EC2 security group
ec2_sg_name_prefix = "netforge-ec2"

# Description for EC2 SG
ec2_sg_description = "Security Group for private EC2 with SSM access"

# VPC ID (example — replace with your own or pull from data source)
vpc_id = "vpc-0abc123456789xyz"

# Tags
common_tags = {
  Project     = "NetForge"
  Environment = "Production"
  Owner       = "DevOps"
}

# Ingress Rules (EC2)
# Example: allow no inbound — EC2 is accessed via SSM only.
ec2_ingress_rules = []

# Egress Rules (EC2)
# Allow all outbound (NAT Gateway provides internet)
ec2_egress_rules = [
  {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
    description = "Allow all outbound"
  }
]


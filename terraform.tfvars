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

#EC2 SECURITY GROUP - Might need tweaking later. 
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

#RDS Security group. 
rds_sg_name_prefix   = "netforge-rds-sg-"
rds_sg_description   = "Security group for RDS"
rds_ingress_rules = [
  {
    from_port        = 5432
    to_port          = 5432
    protocol         = "tcp"
    cidr_blocks      = ["10.0.0.0/16"]    # Your VPC CIDR or specific CIDRs allowed
    description      = "Allow Postgres access from VPC"
  }
]
rds_egress_rules = [
  {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    description      = "Allow all outbound"
  }
]

#RDS 
engine                 = "postgres"
engine_version         = "15.3"
instance_class         = "db.t3.medium"
allocated_storage      = 20
max_allocated_storage  = 100
storage_type           = "gp3"
db_name                = "netforcedb"
db_username            = "admin"
db_password            = "your-secure-password-here"
multi_az               = true
publicly_accessible    = false
deletion_protection    = true
skip_final_snapshot    = true
apply_immediately      = true
backup_retention_period = 7

subnet_ids = [
  "subnet-0aa1bb2cc3dd4ee5f",
  "subnet-1bb2cc3dd4ee5f6aa"
]

security_group_ids = [
  "sg-0a1b2c3d4e5f6g7h8"
]


#IAM ROLE. 
role_name = "netforge2-ec2-role"

assume_role_policy_json = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect": "Allow",
      "Principal": {
        "Service": "ec2.amazonaws.com"
      },
      "Action": "sts:AssumeRole"
    }
  ]
}
EOF

managed_policy_arns = [
  "arn:aws:iam::aws:policy/AmazonEC2ReadOnlyAccess",
  "arn:aws:iam::aws:policy/AmazonSSMManagedInstanceCore",
  "arn:aws:iam::aws:policy/CloudWatchAgentServerPolicy"
]

#KMS 


kms_alias_name             = "netforge-ssm-key"
kms_description            = "KMS key for encrypting SSM parameters"
kms_enable_key_rotation    = true
kms_deletion_window_in_days = 30

ssm_name        = "/netforge-2.0/db-password"
ssm_description = "Database password"
ssm_type        = "SecureString"
ssm_value       = "YourSecurePasswordHere!"

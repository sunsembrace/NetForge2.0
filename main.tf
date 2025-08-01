# VPC Module
module "vpc" {
  source      = "./modules/vpc"
  vpc_cidr    = var.vpc_cidr
  name_prefix = var.name_prefix
  
  project_tag = var.project_tag               # Added to support project tagging in modules
  environment = var.environment               # Added to support environment tagging in modules
}

# Subnets Module
module "subnets" {
  source               = "./modules/subnets"
  vpc_id               = module.vpc.vpc_id            # Pass VPC ID from VPC module output
  availability_zones   = var.availability_zones       # List of AZs (e.g. ["eu-west-2a", "eu-west-2b"])
  private_subnet_cidrs = var.private_subnet_cidrs     # List of private subnet CIDRs (e.g. ["10.0.1.0/24"])
  public_subnet_cidrs  = var.public_subnet_cidrs      # List of public subnet CIDRs (e.g. ["10.0.101.0/24"])
  name_prefix          = var.name_prefix              # Common name prefix for tags

  project_tag          = var.project_tag              # Pass project tag to subnets module
  environment          = var.environment              # Pass environment tag to subnets module
}

# NAT Gateway Module
module "nat_gateway" {
  source            = "./modules/nat-gateway"
  name_prefix       = var.name_prefix
  public_subnet_ids = module.subnets.public_subnet_ids   # Fetch public subnet IDs from subnets module

  project_tag       = var.project_tag                    # Added to support tags inside NAT module
  environment       = var.environment                    # Added to support tags inside NAT module
}

#EC2
# EC2 Instance
module "ec2" {
  source = "./modules/ec2"

  ami_id                    = var.ami_id
  instance_type             = var.instance_type
  subnet_id                 = module.subnets.private_subnet_ids[0]          # Use first private subnet ID
  security_group_ids        = [module.security_group.security_group_id]    # Wrap single SG ID in a list
  iam_instance_profile_name = var.iam_instance_profile_name

  name_prefix   = var.name_prefix
  instance_name = var.instance_name

  project_tag   = var.project_tag
  environment   = var.environment
}

# SECURITY GROUP
module "ec2_security_group" {
  source        = "./modules/security_group"

  name_prefix   = var.ec2_sg_name_prefix
  description   = var.ec2_sg_description
  vpc_id        = var.vpc_id
  tags          = var.common_tags
  ingress_rules = var.ec2_ingress_rules
  egress_rules  = var.ec2_egress_rules

  project_tag   = var.project_tag
  environment   = var.environment
}

module "rds_security_group" {
  source        = "./modules/security_group"
  name_prefix   = var.rds_sg_name_prefix
  description   = var.rds_sg_description
  vpc_id        = var.vpc_id
  tags          = var.common_tags
  ingress_rules = var.rds_ingress_rules
  egress_rules  = var.rds_egress_rules

  project_tag   = var.project_tag
  environment   = var.environment
}

#RDS. 
module "rds" {
  source = "./modules/rds" # path to your RDS module

  name_prefix           = var.name_prefix
  subnet_ids            = var.subnet_ids
  security_group_ids    = var.security_group_ids

  engine                = var.engine
  engine_version        = var.engine_version
  instance_class        = var.instance_class
  allocated_storage     = var.allocated_storage
  max_allocated_storage = var.max_allocated_storage
  storage_type          = var.storage_type

  db_name               = var.db_name
  db_username           = var.db_username
  db_password           = var.db_password

  multi_az              = var.multi_az
  publicly_accessible   = var.publicly_accessible
  skip_final_snapshot   = var.skip_final_snapshot
  deletion_protection   = var.deletion_protection
  apply_immediately     = var.apply_immediately
  backup_retention_period = var.backup_retention_period

  project_tag           = var.project_tag
  environment           = var.environment
}


#SSM Parameter Store.
module "ssm_parameters" {
  source      = "./modules/ssm_parameter_store"
  parameters  = var.parameters
  project_tag = var.project_tag
  environment = var.environment
}

#IAM policy. 
module "iam_role" {
  source             = "./modules/iam"
  role_name          = var.role_name
  assume_role_policy = var.assume_role_policy_json
  managed_policy_arns = var.managed_policy_arns

  project_tag  = var.project_tag
  environment  = var.environment
}

#KMS  - MIGHT NEED TO REMOVE AND REDO STRUGGLING WITH FIXING SSM PARAMETER STORE WHICH NEEDS TO ALL BE EDITED.
module "kms_key" {
  source                  = "./modules/kms"
  alias_name              = var.kms_alias_name
  description             = var.kms_description
  deletion_window_in_days = var.kms_deletion_window_in_days
  enable_key_rotation     = var.kms_enable_key_rotation
  environment             = var.environment
  project_tag             = var.project_tag
}

module "ssm_parameter" {
  source        = "./modules/ssm-parameter"
  name          = var.ssm_name
  value         = var.ssm_value
  type          = var.ssm_type
  kms_key_id    = module.kms_key.key_id
  environment   = var.environment
  project_tag   = var.project_tag
}

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

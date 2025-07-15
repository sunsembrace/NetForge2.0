resource "aws_subnet" "private" {
  count             = length(var.private_subnet_cidrs)
  vpc_id            = var.vpc_id
  cidr_block        = var.private_subnet_cidrs[count.index]
  availability_zone = var.availability_zones[count.index]

  tags = {
    Name = "${var.name_prefix}-private-subnet-${count.index + 1}"
  }
}

resource "aws_subnet" "public" {
  count             = length(var.public_subnet_cidrs)
  vpc_id            = var.vpc_id
  cidr_block        = var.public_subnet_cidrs[count.index]
  availability_zone = var.availability_zones[count.index]

  map_public_ip_on_launch = true

  tags = {
  Name        = "${var.name_prefix}-vpc"
  Project     = var.project_tag
  Environment = var.environment
 }
}

  #count = length - Creates multiple subnets, one per CIDR block in variable
  #cidr block = [count.index] Picks the CIDR block for the subnet based on the current iteration index (count.index) so each subnet gets unique IP range from the list.
  # availabilityzone = [count.index] Assign each subnet to a specific AZ, also by index from the AZ list variable - ensures subnets are spread across AZ's for high availability. 
  #map_public_ip_on_launch = auto tells AWS to assign public IPs to instances launched in this subnet (public ones). 
  
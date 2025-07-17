# Create an Elastic IP (EIP) for each NAT Gateway
resource "aws_eip" "nat_eip" {                             # Changed name from "nat" ➝ "nat_eip" for clarity
  count = length(var.public_subnet_ids)

  domain = "vpc"

 tags = {
  Name        = "${var.name_prefix}-nat_eip"
  Project     = var.project_tag
  Environment = var.environment
 }
}

# Create NAT Gateway(s) in the public subnets
resource "aws_nat_gateway" "public_nat" {                 # Changed name from "this" ➝ "public_nat" for clarity and reusability
  count = length(var.public_subnet_ids)

  allocation_id = aws_eip.nat_eip[count.index].id         # Updated to match renamed EIP resource
  subnet_id     = var.public_subnet_ids[count.index]

  tags = {
  Name        = "${var.name_prefix}-nat_gw"
  Project     = var.project_tag
  Environment = var.environment
 }
}

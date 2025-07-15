#VPC
output "vpc_id" {
  value       = module.vpc.vpc_id
  description = "The ID of the created VPC"
}


#subnets
output "private_subnet_ids" {
  value       = module.subnets.private_subnet_ids
  description = "List of private subnet IDs"
}

output "public_subnet_ids" {
  value       = module.subnets.public_subnet_ids
  description = "List of public subnet IDs"
}

# NAT Gateway Outputs
output "nat_gateway_ids" {
  value       = module.nat_gateway.nat_gateway_ids
  description = "List of NAT Gateway IDs"
}

output "nat_eip_ids" {
  value       = module.nat_gateway.nat_eip_ids
  description = "List of Elastic IP IDs for the NAT Gateways"
}

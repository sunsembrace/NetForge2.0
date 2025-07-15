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

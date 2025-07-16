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

#EC2
output "ec2_instance_id" {
  value       = module.ec2.ec2_instance_id
  description = "EC2 Instance ID"
}

output "ec2_private_ip" {
  value       = module.ec2.ec2_private_ip
  description = "Private IP of EC2"
}

#SECURITY GROUP
output "security_group_id" {
  value       = module.security_group.security_group_id
  description = "Security Group ID for EC2"
}

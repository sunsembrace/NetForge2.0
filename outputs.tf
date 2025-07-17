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

#EC2 SECURITY GROUP
output "security_group_id" {
  description = "The ID of the security group"
  value       = aws_security_group.this.id
}

output "security_group_name" {
  description = "The name of the security group"
  value       = aws_security_group.this.name
}

output "security_group_arn" {
  description = "The ARN of the security group"
  value       = aws_security_group.this.arn
}

#RDS Security group
output "rds_security_group_id" {
  value       = module.rds_security_group.sg_id
  description = "The security group ID for RDS"
}

output "rds_security_group_name" {
  value       = module.rds_security_group.sg_name
  description = "The security group name for RDS"
}

output "rds_security_group_arn" {
  value       = module.rds_security_group.sg_arn
  description = "The security group ARN for RDS"
}

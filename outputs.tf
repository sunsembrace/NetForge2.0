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

#EC2 & RDS SECURITY GROUP
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

#RDS 
output "rds_endpoint" {
  description = "RDS instance endpoint"
  value       = module.rds.rds_instance_endpoint
}

output "rds_arn" {
  description = "RDS instance ARN"
  value       = module.rds.rds_instance_arn
}



#IAM ROLE. 
output "iam_role_name" {
  description = "The name of the IAM role"
  value       = module.iam_role.iam_role_name
}

output "iam_role_arn" {
  description = "The ARN of the IAM role"
  value       = module.iam_role.iam_role_arn
}

#KSM
output "kms_key_arn" {
  description = "ARN of the created KMS key"
  value       = module.kms_key.key_arn
}

output "kms_key_alias" {
  description = "Alias name of the created KMS key"
  value       = module.kms_key.alias_name
}

#SSM Parameter store
output "ssm_parameter_name" {
  description = "Name of the created SSM parameter"
  value       = module.ssm_parameter.name
}

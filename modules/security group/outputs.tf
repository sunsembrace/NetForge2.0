output "security_group_id" {
  description = "ID of the security group"
  value       = aws_security_group.ec2_sg.id
}

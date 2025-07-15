output "ec2_instance_id" {
  value       = aws_instance.this.id
  description = "ID of the EC2 instance"
}

output "ec2_private_ip" {
  value       = aws_instance.this.private_ip
  description = "Private IP of the EC2 instance"
}

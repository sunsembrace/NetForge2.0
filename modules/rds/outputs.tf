output "rds_instance_id" {
  description = "ID of the RDS instance"
  value       = aws_db_instance.this.id
}

output "rds_endpoint" {
  description = "RDS database endpoint"
  value       = aws_db_instance.this.endpoint
}

output "rds_arn" {
  description = "ARN of the RDS instance"
  value       = aws_db_instance.this.arn
}
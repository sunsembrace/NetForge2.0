output "rds_instance_endpoint" {
  description = "The connection endpoint for the RDS instance"
  value       = aws_db_instance.rds_instance.endpoint
}

output "rds_instance_arn" {
  description = "The ARN of the RDS instance"
  value       = aws_db_instance.rds_instance.arn
}

output "rds_instance_id" {
  description = "The RDS instance identifier"
  value       = aws_db_instance.rds_instance.id
}

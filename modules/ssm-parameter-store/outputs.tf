output "parameter_arn" {
  description = "ARN of the SSM parameter"
  value       = aws_ssm_parameter.ssm_parameter.arn
}

output "parameter_name" {
  description = "Name of the SSM parameter"
  value       = aws_ssm_parameter.ssm_parameter.name
}

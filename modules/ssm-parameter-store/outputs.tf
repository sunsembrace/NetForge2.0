output "ssm_parameter_names" {
  description = "Names of the SSM parameters created"
  value       = [for p in aws_ssm_parameter.ssm_parameters : p.name]
}

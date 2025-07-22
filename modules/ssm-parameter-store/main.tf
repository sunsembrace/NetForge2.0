resource "aws_ssm_parameter" "ssm_parameters" {
  for_each = {
    for param in var.parameters : param.name => param
  }

  name        = each.value.name
  type        = each.value.type         # String, SecureString, or StringList
  value       = each.value.value
  description = each.value.description

  tags = {
    Project     = var.project_tag
    Environment = var.environment
    Name        = each.value.name
  }
}

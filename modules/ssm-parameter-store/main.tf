resource "aws_ssm_parameter" "ssm_parameter" {
  name        = var.name
  description = var.description
  type        = var.type
  value       = var.value

  key_id      = var.kms_key_id != "" ? var.kms_key_id : null

  tags = {
    Environment = var.environment
    Project     = var.project_tag
  }
}


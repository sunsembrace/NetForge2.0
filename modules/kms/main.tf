resource "aws_kms_key" "kms_key" {
  description             = var.description
  deletion_window_in_days = var.deletion_window_in_days
  enable_key_rotation     = var.enable_key_rotation

  tags = {
    Project     = var.project_tag
    Environment = var.environment
  }
}

resource "aws_kms_alias" "kms_alias" {
  name          = "alias/${var.alias_name}"
  target_key_id = aws_kms_key.kms_key.key_id
}

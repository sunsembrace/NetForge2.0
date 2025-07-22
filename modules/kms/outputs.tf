output "key_id" {
  description = "KMS key ID"
  value       = aws_kms_key.kms_key.key_id
}

output "key_arn" {
  description = "KMS key ARN"
  value       = aws_kms_key.kms_key.arn
}

output "alias_name" {
  description = "Alias name for the KMS key"
  value       = aws_kms_alias.kms_alias.name
}

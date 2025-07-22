resource "aws_iam_role" "role" {
  name               = var.role_name
  assume_role_policy = var.assume_role_policy

  tags = {
    Project     = var.project_tag
    Environment = var.environment
  }
}

resource "aws_iam_role_policy_attachment" "managed_policy_attachment" {
  for_each = toset(var.managed_policy_arns)

  role       = aws_iam_role.role.name
  policy_arn = each.value
}

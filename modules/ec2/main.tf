resource "aws_instance" "private_ec2" {
  ami           = var.ami_id
  instance_type = var.instance_type
  subnet_id     = var.subnet_id
  vpc_security_group_ids = var.security_group_ids
  iam_instance_profile    = var.iam_instance_profile_name

  associate_public_ip_address = false  # must stay false for private subnet use
  key_name                    = null   # not using SSH key, only SSM

  tags = {
    Name        = "${var.name_prefix}-${var.instance_name}"
    Project     = var.project_tag
    Environment = var.environment
  }

  lifecycle {
    ignore_changes = [ami]  # Optional: helpful if AMI updates later
  }
}

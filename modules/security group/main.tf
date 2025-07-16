resource "aws_security_group" "ec2_sg" {
  name_prefix = "${var.name_prefix}-ec2-sg"
  description = "Security group for EC2 instance"
  vpc_id      = var.vpc_id

  # Allow all outbound
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  # Allow inbound traffic from within the VPC (optional, for internal comms)
  ingress {
    from_port       = 0
    to_port         = 0
    protocol        = "-1"
    cidr_blocks     = [var.vpc_cidr]
    description     = "Allow all traffic within the VPC"
  }

  tags = {
    Name        = "${var.name_prefix}-ec2-sg"
    Project     = var.project_tag
    Environment = var.environment
  }
}

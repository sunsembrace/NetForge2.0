resource "aws_db_subnet_group" "this" {
  name       = "${var.name_prefix}-rds-subnet-group"
  subnet_ids = var.subnet_ids
  tags = {
    Project     = var.project_tag
    Environment = var.environment
  }
}

resource "aws_db_instance" "this" {
  identifier              = "${var.name_prefix}-rds"
  engine                  = "postgres"
  engine_version          = var.engine_version
  instance_class          = var.instance_class
  allocated_storage       = var.allocated_storage
  max_allocated_storage   = var.max_allocated_storage
  storage_type            = "gp2"
  db_subnet_group_name    = aws_db_subnet_group.this.name
  vpc_security_group_ids  = var.security_group_ids
  db_name                 = var.db_name
  username                = var.db_username
  password                = var.db_password
  multi_az                = true
  publicly_accessible     = false
  skip_final_snapshot     = true
  deletion_protection     = true
  apply_immediately       = true
  backup_retention_period = 7

  tags = {
    Project     = var.project_tag
    Environment = var.environment
  }
}

resource "aws_db_subnet_group" "rds_subnet_group" {
  name       = "${var.name_prefix}-rds-subnet-group"
  subnet_ids = var.subnet_ids

  tags = {
    Name        = "${var.name_prefix}-rds-subnet-group"
    Project     = var.project_tag
    Environment = var.environment
  }
}

resource "aws_db_instance" "rds_instance" {
  identifier              = "${var.name_prefix}-rds"
  engine                  = var.engine
  engine_version          = var.engine_version
  instance_class          = var.instance_class
  allocated_storage       = var.allocated_storage
  max_allocated_storage   = var.max_allocated_storage
  storage_type            = var.storage_type
  db_subnet_group_name    = aws_db_subnet_group.rds_subnet_group.name
  vpc_security_group_ids  = var.security_group_ids
  db_name                 = var.db_name
  username                = var.db_username
  password                = var.db_password
  multi_az                = var.multi_az
  publicly_accessible     = var.publicly_accessible
  skip_final_snapshot     = var.skip_final_snapshot
  deletion_protection     = var.deletion_protection
  apply_immediately       = var.apply_immediately
  backup_retention_period = var.backup_retention_period

  tags = {
    Name        = "${var.name_prefix}-rds"
    Project     = var.project_tag
    Environment = var.environment
  }
}

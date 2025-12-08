resource "aws_db_subnet_group" "db_subnet_group" {
  name = "${replace(lower(var.project_name), " ", "-")}-db-subnet-group"

  description = "Subnet group for RDS in private DB subnets"
  subnet_ids  = var.private_db_subnets

  tags = {
    name = "${lower(var.project_name)}-db-subnet-group"
  }
}

resource "aws_db_instance" "rds_instance" {
  identifier             = "${replace(lower(var.project_name), " ", "-")}-rds"
  engine                 = "mysql"
  engine_version         = "8.0"
  instance_class         = var.instance_class
  allocated_storage      = var.allocated_storage
  db_name                = var.db_name
  username               = var.db_username
  password               = var.db_password
  publicly_accessible    = false
  vpc_security_group_ids = [var.private_db_sg_id]
  db_subnet_group_name   = aws_db_subnet_group.db_subnet_group.name

  backup_retention_period = var.backup_retention_days
  multi_az                = true
  storage_encrypted       = true
  skip_final_snapshot     = false

  tags = {
    name = "${lower(var.project_name)}-db-subnet-group"

    Environment = var.environment
  }
}


# RDS Instance
resource "aws_db_instance" "db1" {
  identifier              = "mysql-db1"
  engine                  = "mysql"
  instance_class          = var.instance_class
  allocated_storage       = var.allocated_storage
  username                = var.db_username
  password                = var.db_password
  db_name                 = var.db_name
  port                    = 3306

  publicly_accessible     = false
  vpc_security_group_ids  = [aws_security_group.db_sg.id]
  db_subnet_group_name    = aws_db_subnet_group.mysql_grp.name
  backup_retention_period = var.backup_retention_days

  skip_final_snapshot = true

  tags = {
    Name = "mysql-db1"
  }
}


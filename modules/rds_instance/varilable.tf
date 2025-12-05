variable "project_name" {
  description = "Project name for tagging and resource naming"
  type        = string
}

variable "instance_class" {
  description = "Instance class for the RDS database"
  type        = string
}

variable "allocated_storage" {
  description = "Allocated storage size in GB"
  type        = number
}

variable "db_username" {
  description = "Master username for the RDS instance"
  type        = string
}

variable "db_password" {
  description = "Master password for the RDS instance"
  type        = string
  sensitive   = true
}

variable "db_name" {
  description = "Database name to create"
  type        = string
}

variable "backup_retention_days" {
  description = "Number of days to retain automated backups"
  type        = number
}

variable "private_db_sg_id" {
  description = "ID of the private DB security group"
  type        = string
}

variable "db_subnet_group_name" {
  description = "Name of the DB subnet group"
  type        = string
}

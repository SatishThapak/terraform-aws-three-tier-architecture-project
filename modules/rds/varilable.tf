variable "project_name" {}
variable "private_db_subnets" {
  type        = list(string)
  description = "List of private DB subnet IDs"
}
variable "private_db_sg_id" {
  type        = string
  description = "Security group ID for RDS"
}

variable "db_engine" {
  type    = string
  default = "mysql"
}
variable "db_engine_version" {
  type    = string
  default = "8.0"
}
variable "db_instance_class" {
  type    = string
  default = "db.t3.micro"
}
variable "allocated_storage" {
  type    = number
  default = 20
}
variable "db_name" {
  type    = string
  default = "appdb"
}
variable "db_username" {
  type = string
}
variable "db_password" {
  type      = string
  sensitive = true
}

# Best practice extras
variable "multi_az" {
  type    = bool
  default = true
}
variable "backup_retention_period" {
  type    = number
  default = 7
}
variable "skip_final_snapshot" {
  type    = bool
  default = false
}
variable "environment" {
  type    = string
  default = "production"
}
variable "allowed_cidr_blocks" {

}

variable "backup_retention_days" {

}
variable "instance_class" {

}


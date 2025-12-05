variable "project_name" {
  type        = string
  description = "Name of the project for tagging resources"
}

variable "vpc_cidr" {
  type        = string
  description = "CIDR block for the VPC"
}

variable "public_subnet_az1_cidr" {
  type        = string
  description = "CIDR block for public subnet in AZ1"
}

variable "public_subnet_az2_cidr" {
  type        = string
  description = "CIDR block for public subnet in AZ2"
}

variable "private_app_subnet_az1_cidr" {
  type        = string
  description = "CIDR block for private app subnet in AZ1"
}

variable "private_app_subnet_az2_cidr" {
  type        = string
  description = "CIDR block for private app subnet in AZ2"
}

variable "private_data_subnet_az1_cidr" {
  type        = string
  description = "CIDR block for private DB subnet in AZ1"
}

variable "private_data_subnet_az2_cidr" {
  type        = string
  description = "CIDR block for private DB subnet in AZ2"
}

variable "instance_class" {
  
}

variable "allocated_storage" {
  
}
variable "db_password" {
  
}

variable "db_username" {
  
}
variable "db_name" {
  
}
variable "backup_retention_days" {
  
}
variable "allowed_cidr_blocks" {
  
}
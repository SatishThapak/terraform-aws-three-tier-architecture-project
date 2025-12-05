output "db_instance_id" {
  description = "ID of the RDS instance"
  value       = aws_db_instance.db1.id
}

output "db_instance_endpoint" {
  description = "Writer endpoint of the RDS instance"
  value       = aws_db_instance.db1.endpoint
}

output "db_instance_name" {
  description = "Database name created in RDS"
  value       = aws_db_instance.db1.db_name
}

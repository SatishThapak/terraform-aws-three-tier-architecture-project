output "vpc_id" {
  value = aws_vpc.vpc.id
}

output "public_subnets" {
  value = [aws_subnet.public_subnet_az1.id, aws_subnet.public_subnet_az2.id]
}

output "private_app_subnets" {
  value = [aws_subnet.private_app_subnet_az1.id, aws_subnet.private_app_subnet_az2.id]
}

output "private_db_subnets" {
  value = [aws_subnet.private_data_subnet_az1.id, aws_subnet.private_data_subnet_az2.id]
}

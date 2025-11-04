output "public_lb_sg_id" {
  value = aws_security_group.public_lb.id
}

output "web_tier_sg_id" {
  value = aws_security_group.web_tier.id
}

output "internal_lb_sg_id" {
  value = aws_security_group.internal_lb.id
}

output "private_app_sg_id" {
  value = aws_security_group.private_app.id
}

output "private_db_sg_id" {
  value = aws_security_group.private_db.id
}

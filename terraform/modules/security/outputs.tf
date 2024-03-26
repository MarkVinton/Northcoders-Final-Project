output "security_group_ids" {
  value = [
  aws_security_group.allow_egress.id, 
  aws_security_group.allow_http.id, 
  aws_security_group.allow_http_3000.id,
  aws_security_group.allow_https.id, 
  aws_security_group.allow_ssh.id,
  aws_security_group.rds_database_access.id
  ]
}

output "alb_security_group_id" {
  value = aws_security_group.alb_sg.id
}
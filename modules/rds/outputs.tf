output "rds_endpoint" {
  value = aws_db_instance.test.endpoint
}

output "rds_arn" {
  value = aws_db_instance.test.arn
}

output "rds_name" {
  value = aws_db_instance.test.db_name
}

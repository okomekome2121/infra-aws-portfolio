output "elb_sg_id" {
  description = "Security Group ID for ALB"
  value       = aws_security_group.alb_sg.id
}

output "ec2_sg_id" {
  description = "Security Group ID for the application"
  value       = aws_security_group.ec2_sg.id
}


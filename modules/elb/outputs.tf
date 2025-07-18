# output "elb_dns_name" {
#   value       = aws_lb.dev_test.dns_name
#   description = "DNS name of the elb"
# }

output "target_group_arn" {
  value       = aws_lb_target_group.dev_test.arn
  description = "ARN of the target group"
}

output "elb_arn" {
  value       = aws_lb.dev_test.arn
  description = "ARN of the elb"
}

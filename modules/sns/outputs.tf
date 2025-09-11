output "sns_topic_arn" {
  value       = aws_sns_topic.default.arn
  description = "SNS topic ARN used for EC2 stop notifications."
}

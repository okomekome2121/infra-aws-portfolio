output "sns_topic_arn" {
  value       = aws_sns_topic.dev-test.arn
  description = "SNS topic ARN used for EC2 stop notifications."
}

output "event_rule_name" {
  value       = aws_cloudwatch_event_rule.ec2_stopped.name
  description = "Name of the EventBridge rule that triggers the notification."
}

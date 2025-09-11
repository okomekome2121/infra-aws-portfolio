variable "environment" {
  type        = string
  description = "Environment name (e.g., dev, staging, prod)"
  default     = "prod"
}

variable "name" {
  type        = string
  description = "EventBridge rule name"
}

variable "state" {
  type        = string
  description = "EC2 instance state to monitor (e.g., stopped)"
  default     = "stopped"
}

variable "instance_ids" {
  type        = list(string)
  description = "List of EC2 instance IDs to monitor. If empty, all instances are monitored."
  default     = []
}

variable "sns_topic_arn" {
  type        = string
  description = "SNS topic ARN"
}

variable "input_template" {
  description = "Input template for the SNS message."
  default     = "EC2 Instance <id> changed to <state> at <time> (<region>)"
  
}

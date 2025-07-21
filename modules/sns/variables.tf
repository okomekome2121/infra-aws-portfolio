variable "notification_email" {
  description = "Email address (Gmail ok) to receive EC2 stopped notifications."
  type        = string
  default     = "okomekome.2121@gmail.com"
}

# 任意: 特定のインスタンスに限定（空リストなら全EC2）
variable "instance_ids" {
  description = "List of EC2 Instance IDs to monitor. If empty, all EC2 stop events will trigger."
  type        = list(string)
  default     = []
}

# SNSトピック名を外部で制御したい場合（任意）
variable "topic_name" {
  description = "SNS topic name."
  type        = string
  default     = "ec2-stop-alerts"
}

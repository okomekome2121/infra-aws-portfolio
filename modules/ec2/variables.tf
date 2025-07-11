variable "ami_id" {
  description = "AMI ID to use for the EC2 instance"
  type        = string
}

# variable "vpc_id" {
#   description = "VPC ID"
#   type        = string
  
# }

variable "instance_type" {
  description = "EC2 instance type"
  type        = string
  default     = "t3.micro"
}

variable "subnet_id" {
  description = "List of subnet IDs to place instances in"
  type        = list(string)
}

variable "key_name" {
  description = "SSH key name"
  type        = string
}

variable "environment" {
  description = "The environment for which the resources are being created (e.g., dev, prod)"
  type        = string
  default     = "dev"
}

variable "tags" {
  description = "Tags to apply to the resources"
  type        = map(string)
  default     = {}
}

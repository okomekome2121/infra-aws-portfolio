variable "name" {
  description = "Prefix name for resources"
  type        = string
}

variable "vpc_id" {
  description = "VPC ID where SG is created"
  type        = string
}

variable "ingress_cidr_blocks" {
  description = "Allowed CIDR blocks for EC2 ingress"
  type        = list(string)
  default     = ["0.0.0.0/0"]
}

variable "egress_cidr_blocks" {
  description = "Allowed CIDR blocks for EC2 egress"
  type        = list(string)
  default     = ["0.0.0.0/0"]
}

variable "environment" {
  description = "Environment tag"
  type        = string
}


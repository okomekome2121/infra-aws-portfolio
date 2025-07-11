variable "name" {
  description = "Prefix name for resources"
  type        = string
}

variable "vpc_id" {
  description = "VPC ID where SG is created"
  type        = string
}

variable "ingress_cidr_blocks" {
  description = "Allowed CIDR blocks for ALB ingress"
  type        = list(string)
  default     = ["0.0.0.0/0"]
}

variable "egress_cidr_blocks" {
  description = "Allowed CIDR blocks for ALB egress"
  type        = list(string)
  default     = ["0.0.0.0/0"]
}

variable "environment" {
  description = "Environment (e.g. dev, prod)"
  type        = string
}


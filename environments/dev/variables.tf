variable "region" {
  default = "ap-northeast-1"
}

variable "availability_zones" {
  description = "List of availability zones"
  type        = list(string)
}

variable "cidr_block" {
  type        = string
  description = "VPCのCIDRブロック"   
}

variable "public_subnet_cidrs" {
  description = "CIDR block for the public subnet"
  type        = list(string)
}

variable "private_subnet_cidrs" {
  description = "List of CIDR blocks for private subnets."
  type        = list(string)
}

variable "ami_id" {
  description = "AMI ID to use for the EC2 instance"
  type        = string
} 

variable "instance_type" {
  description = "EC2 instance type"
  type        = string
  default     = "t3.micro"
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

variable "execution_role_arn" {
  description = "ARN of the ECS task execution role"
  type        = string
}

variable "task_role_arn" {
  description = "ARN of the ECS task role"
  type        = string
}

variable "container_image" {
  description = "Docker image to use for the ECS container"
  type        = string
}

variable "elb_target_ips" {
  description = "List of IP addresses to register to the elb target group"
  type        = list(string)
  default     = []
}

# variable "vpc_id" {
#   description = "VPC ID"
#   type        = string
# }

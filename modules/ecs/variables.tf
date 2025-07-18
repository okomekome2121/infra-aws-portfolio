variable "environment" {
  description = "The environment for which the resources are being created (e.g., dev, prod)"
  type = string
}

variable "execution_role_arn" {
  description = "ARN of the ECS task execution role"
  type = string
}

variable "task_role_arn" {
  description = "ARN of the ECS task role"
  type = string
}

variable "container_image" {
  description = "Docker image to use for the ECS container"
  type = string
}

variable "subnet_id" {
  description = "List of subnet IDs to place ECS tasks in"
  type = list(string)
}

variable "security_group_ids" {
  description = "List of security group IDs to associate with the ECS tasks"
  type = list(string)
  default = []
  
}


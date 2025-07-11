variable "environment" {
  type = string
}

variable "execution_role_arn" {
  type = string
}

variable "task_role_arn" {
  type = string
}

variable "container_image" {
  type = string
}

variable "subnet_id" {
  type = list(string)
}

variable "security_group_ids" {
  type = list(string)
  default = []
  
}

# variable "security_group_ids" {
#   type = list(string)
# }

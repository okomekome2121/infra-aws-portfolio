variable "vpc_id" {
  description = "The ID of an existing VPC."
  type        = string
  default     = null 
}

variable "cidr_block" {
  description = "The CIDR block for the VPC or subnet."
  type        = string
}

variable "availability_zones" {
  description = "The availability zone for the subnet."
  type        = list(string)
  default     = null
}

variable "public_subnet_cidrs" {
  type        = list(string)
  description = "List of CIDR blocks for public subnets"
  default     = []
}

variable "private_subnet_cidrs" {
  type        = list(string)
  description = "List of CIDR blocks for private subnets"
  default     = []
}

variable "gateway_id" {
  description = "The ID of an Internet Gateway."
  type        = string
  default     = null
}

# variable "name" {
#   description = "Base name to apply to resources, such as Name tags."
#   type        = string
#   default     = null
# }

variable "name_prefix" {
  description = "Prefix added to resource names (e.g., 'dev-', 'prod-')."
  type        = string
  default     = "dev"
}

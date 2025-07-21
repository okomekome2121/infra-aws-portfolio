variable "environment" {
  description = "Environment tag"
  type        = string
  default     = "dev"
}

variable "bucket_name" {
  description = "The name of the S3 bucket"
  type        = string
}

variable "versioning_enabled" {
  description = "Enable versioning for the S3 bucket"
  type        = bool
  default     = true
}

variable "encryption_enabled" {
  description = "Enable server-side encryption for the S3 bucket"
  type        = bool
  default     = true
}

variable "public_access_block_enabled" {
  description = "Enable public access block for the S3 bucket"
  type        = bool
  default     = true
}

variable "lifecycle_configuration_enabled" {
    description = "Enable lifecycle configuration for the S3 bucket"
    type        = bool
    default     = true
}

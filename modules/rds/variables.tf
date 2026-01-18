# variable "environment" {
#   description = "The environment for the RDS instance (e.g., dev, staging, prod)."
#   type        = string
  
# }
# variable "project" {
#   description = "The project name for tagging purposes."
#   type        = string
#   default     = "myapp"
  
# }
# variable "tags" {
#   description = "A map of tags to assign to the resource."
#   type        = map(string)
#   default     = {}
  
# }
# variable "db_identifier" {
#   description = "The DB instance identifier."
#   type        = string
# }
# variable "allocated_storage" {
#   description = "The allocated storage size for the DB instance."
#   type        = number
#   default     = 20
# }
# variable "engine" {
#   description = "The database engine to use."
#   type        = string
#   default     = "mysql"
# }
# variable "engine_version" {
#   description = "The version of the database engine to use."
#   type        = string
#   default     = "8.0"
# }
# variable "instance_class" {
#   description = "The instance class to use for the DB instance."
#   type        = string
#   default     = "db.t3.micro"
# }
# variable "username" {
#   description = "The master username for the DB instance."
#   type        = string
# }
# variable "password" {
#   description = "The master password for the DB instance."
#   type        = string
#   sensitive   = true
# }
# variable "db_name" {
#   description = "The name of the database to create."
#   type        = string
#   default     = "appdb"
# }
# variable "parameter_group_name" {
#   description = "The name of the DB parameter group to use."
#   type        = string
#   default     = "default.mysql8.0"
# }
# variable "skip_final_snapshot" {
#   description = "Whether to skip the final snapshot before deletion."
#   type        = bool
#   default     = true
# }
# variable "multi_az" {
#   description = "Whether to enable Multi-AZ for the DB instance."
#   type        = bool
#   default     = false
# }
# variable "storage_type" {
#   description = "The storage type to use for the DB instance."
#   type        = string
#   default     = "gp2"
# }
# variable "publicly_accessible" {
#   description = "Whether the DB instance is publicly accessible."
#   type        = bool
#   default     = false
# }
# variable "vpc_security_group_ids" {
#   description = "The VPC security group IDs to associate with the DB instance."
#   type        = list(string)
# }
# variable "db_subnet_group_name" {
#   description = "The DB subnet group to use for the DB instance."
#   type        = string
#   default = ""
# }
# variable "backup_retention_period" {
#   description = "The number of days to retain backups."
#   type        = number
#   default     = 7
# }
# variable "maintenance_window" {
#   description = "The weekly time range during which system maintenance can occur."
#   type        = string
#   default     = "Mon:00:00-Mon:03:00"
# }
# variable "backup_window" {
#   description = "The daily time range during which automated backups are created."
#   type        = string
#   default     = "03:00-04:00"
  
# }


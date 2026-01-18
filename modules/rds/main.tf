# locals {
#   db_name = "${var.environment}-test"
# }

# resource "aws_db_instance" "test" {
#   identifier              = var.db_identifier
#   allocated_storage       = var.allocated_storage
#   engine                  = var.engine
#   engine_version          = var.engine_version
#   instance_class          = var.instance_class
#   username                = var.username
#   password                = var.password
#   db_name                 = var.db_name
#   parameter_group_name    = var.parameter_group_name
#   skip_final_snapshot     = var.skip_final_snapshot
#   multi_az                = var.multi_az
#   storage_type            = var.storage_type
#   publicly_accessible     = var.publicly_accessible
#   vpc_security_group_ids  = var.vpc_security_group_ids
#   db_subnet_group_name    = var.db_subnet_group_name

#   backup_retention_period = var.backup_retention_period
#   maintenance_window      = var.maintenance_window
#   backup_window           = var.backup_window

#   tags = merge(
#     {
#       Name = "${var.project}-${var.environment}-rds"
#     },
#     var.tags
#   )
# }

# versioning_configuration = {
#   status = "Enabled"
# }
# server_side_encryption_configuration = {
#   rule = {
#     apply_server_side_encryption_by_default = {
#       sse_algorithm = "AES256"
#     }
#   }
# }
# public_access_block = {
#   block_public_acls       = true
#   block_public_policy     = true
#   ignore_public_acls      = true
#   restrict_public_buckets = true
# }
# lifecycle_configuration = {
#   rule = {
#     id     = "log-expiration"
#     status = "Enabled"
#     transition = {
#       days          = 30
#       storage_class = "STANDARD_IA"
#     }
#     expiration = {
#       days = 90
#     }
#   }
# }

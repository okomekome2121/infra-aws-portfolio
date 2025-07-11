resource "aws_s3_bucket" "dev_test" {
  bucket = var.bucket_name

  tags = {
    Name        = var.bucket_name
    Environment = var.environment
  }
}

resource "aws_s3_bucket_versioning" "dev_test" {
  bucket = aws_s3_bucket.dev_test.id

  versioning_configuration {
    status = "Enabled"
  }
}

resource "aws_s3_bucket_server_side_encryption_configuration" "dev_test" {
  bucket = aws_s3_bucket.dev_test.id

  rule {
    apply_server_side_encryption_by_default {
      sse_algorithm = "AES256"
    }
  }
}

resource "aws_s3_bucket_public_access_block" "dev_test" {
  bucket = aws_s3_bucket.dev_test.id

  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true
}

resource "aws_s3_bucket_lifecycle_configuration" "dev_test" {
  bucket = aws_s3_bucket.dev_test.id

  rule {
    id     = "log-expiration"
    status = "Enabled"

    filter {
      prefix = ""
    }
    
    transition {
      days          = 30
      storage_class = "STANDARD_IA"
    }

    expiration {
      days = 90
    }
  }
}

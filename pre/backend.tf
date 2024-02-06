# S3 bucket resource for Terraform state file storage
resource "aws_s3_bucket" "state_file_storage" {
  bucket = "tf-state-cross-region"

  tags = merge(
    var.global_tags,
    {
      Name        = "TerraformState-CrossRegion"
      Description = "Terraform State Storage for Cross-Region Deployment"
    }
  )
}

# Enable versioning for the S3 bucket used to store Terraform state files
resource "aws_s3_bucket_versioning" "bucket_versioning" {
  bucket = aws_s3_bucket.state_file_storage.id

  versioning_configuration {
    status = "Enabled"
  }
}

# Configure server-side encryption using AES256 for the S3 bucket storing Terraform state files
resource "aws_s3_bucket_server_side_encryption_configuration" "bucket_encryption" {
  bucket = aws_s3_bucket.state_file_storage.id
  
  rule {
    apply_server_side_encryption_by_default {
      sse_algorithm = "AES256"
    }
  }
}

# DynamoDB table for state locking to prevent conflicts
resource "aws_dynamodb_table" "state_locking" {
  name         = "tf-state-lock-cross-region"
  billing_mode = "PAY_PER_REQUEST"
  hash_key     = "LockID"

  attribute {
    name = "LockID"
    type = "S"
  }

  tags = merge(
    var.global_tags,
    {
      Name        = "TerraformStateLock-CrossRegion"
      Description = "Terraform State Locking for Cross-Region Deployment"
    }
  )
}

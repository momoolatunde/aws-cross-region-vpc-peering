# Terraform S3 backend for state storage and DynamoDB for state locking
terraform {
  backend "s3" {
    bucket         = "tf-state-cross-region"
    key            = "eu-west-3/terraform.tfstate"
    region         = "eu-north-1"
    dynamodb_table = "tf-state-lock-cross-region"
    encrypt        = true
  }
}

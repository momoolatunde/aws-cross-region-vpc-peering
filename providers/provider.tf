# Terraform block to specify the required provider and its version
terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.33.0"
    }
  }
}

# Default AWS provider configuration for eu-north-1
provider "aws" {
  region = "eu-north-1"
}

# Additional AWS provider configuration for eu-west-1
provider "aws" {
  alias  = "eu-west-1"
  region = "eu-west-1"
}

# Additional AWS provider configuration for eu-west-3
provider "aws" {
  alias  = "eu-west-3"
  region = "eu-west-3"
}

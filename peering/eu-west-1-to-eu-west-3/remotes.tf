# Fetch the state of Ireland VPC
data "terraform_remote_state" "eu_west_1" {
  backend = "s3"
  config = {
    bucket = "tf-state-cross-region"
    key    = "eu-west-1/terraform.tfstate"
    region = "eu-north-1"
  }
}

# Fetch the state of Paris VPC
data "terraform_remote_state" "eu_west_3" {
  backend = "s3"
  config = {
    bucket = "tf-state-cross-region"
    key    = "eu-west-3/terraform.tfstate"
    region = "eu-north-1"
  }
}

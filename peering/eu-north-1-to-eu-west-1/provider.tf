# Default AWS provider for the eu-north-1 region.
provider "aws" {
  region = "eu-north-1"
}

# AWS provider with alias for eu-west-1 region.
provider "aws" {
  alias  = "eu-west-1"
  region = "eu-west-1"
}

# AWS provider with alias for the requester's region.
provider "aws" {
  alias  = "requester"
  region = var.requester_region
}

# AWS provider with alias for the peer (accepter) region.
provider "aws" {
  alias  = "accepter"
  region = var.peer_region
}

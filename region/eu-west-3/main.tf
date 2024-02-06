# Invokes the VPC module, configuring subnets and global tags.
module "vpc" {
  source                     = "../../modules/vpc"
  vpc_name                   = var.vpc_name
  region                     = var.region
  vpc_cidr_block             = var.vpc_cidr_block
  subnet_cidr_block          = var.subnet_cidr_block
  web_subnet_cidr_block      = var.web_subnet_cidr_block
  database_subnet_cidr_block = var.database_subnet_cidr_block
  subnet_names               = var.subnet_names
  web_subnet_names           = var.web_subnet_names
  database_subnet_names      = var.database_subnet_names
  global_tags                = var.global_tags
}

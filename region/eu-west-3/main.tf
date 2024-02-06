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
  nat_gateway_ids            = module.nat.nat_gateway_ids
}

# Creating NAT gateways with associated Elastic IPs in specified subnets
module "nat" {
  source              = "../../modules/nat"
  elastic_ip_names    = var.elastic_ip_names
  nat_gateway_names   = var.nat_gateway_names
  subnets_ids         = module.vpc.subnets_ids
  global_tags         = var.global_tags
  internet_gateway_id = module.vpc.internet_gateway_id
}

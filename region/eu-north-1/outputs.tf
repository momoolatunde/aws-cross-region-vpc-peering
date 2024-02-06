# Outputs the ID created by the VPC module.
output "vpc_id" {
  value = module.vpc.main_vpc_id
}

# Outputs the IDs of public subnets created by the VPC module.
output "public_subnet_ids" {
  value = module.vpc.subnets_ids
}

# Outputs the IDs of web subnets created by the VPC module.
output "web_subnet_ids" {
  value = module.vpc.web_subnet_ids
}

# Outputs the IDs of database subnets created by the VPC module.
output "database_subnet_ids" {
  value = module.vpc.database_subnet_ids
}

# Outputs the Internet Gateway ID associated with the VPC.
output "internet_gateway_id" {
  value = module.vpc.internet_gateway_id
}

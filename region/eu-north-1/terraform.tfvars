# name of the VPC
vpc_name = "StockholmVPC"

# name of the VPC region
region = "Stockholm"

# CIDR block for the main VPC
vpc_cidr_block = "10.0.0.0/16"

# CIDR blocks for public subnets in the VPC
subnet_cidr_block = ["10.0.1.0/24", "10.0.3.0/24"]

# CIDR blocks for web subnets in the VPC
web_subnet_cidr_block = ["10.0.2.0/24", "10.0.4.0/24"]

# CIDR blocks for database subnets in the VPC
database_subnet_cidr_block = ["10.0.6.0/24", "10.0.8.0/24"]

# Variable for specifying names of the public subnets
subnet_names = ["PublicSubnet1", "PublicSubnet2"]

# Variable for specifying names of the web subnets
web_subnet_names = ["WebSubnet1", "WebSubnet2"]

# Variable for specifying names of the database subnets
database_subnet_names = ["DatabaseSubnet1", "DatabaseSubnet2"]

# Global tags for resources
global_tags = {
  Environment = "Development"
  ManagedBy   = "Terraform"
}

# Names for the Elastic IPs
elastic_ip_names = ["ElasticIP1", "ElasticIP2"]

# Names for the NAT gateways
nat_gateway_names = ["NatGateway1", "NatGateway2"]

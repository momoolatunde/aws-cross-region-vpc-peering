# Variable for defining the name of the VPC
variable "vpc_name" {
  description = "The name of the VPC."
  type        = string
}

# Variable for defining the region where resources will be created
variable "region" {
  description = "The AWS region where resources will be created."
  type        = string
}

# Variable for defining the CIDR block of the main VPC
variable "vpc_cidr_block" {
  type        = string
  description = "The CIDR block for the VPC."
}

# Variable for defining the CIDR blocks of public subnets
variable "subnet_cidr_block" {
  type        = list(string)
  description = "The CIDR block for the public subnets."
}

# Variable for defining the CIDR blocks of web subnets
variable "web_subnet_cidr_block" {
  type        = list(string)
  description = "The CIDR block for the web subnets."
}

# Variable for defining the CIDR blocks of database subnets
variable "database_subnet_cidr_block" {
  type        = list(string)
  description = "The CIDR block for the database subnets."
}

# Variable for defining the names of the public subnets
variable "subnet_names" {
  type        = list(string)
  description = "The names of the public subnets."
}

# Variable for defining the names of the web subnets
variable "web_subnet_names" {
  type        = list(string)
  description = "The names of the web subnets."
}

# Variable for defining the names of the database subnets
variable "database_subnet_names" {
  type        = list(string)
  description = "The names of the database subnets."
}

# Variable for defining Global tags
variable "global_tags" {
  type = map(string)
}

# Variable for specifying the names of the Elastic IPs
variable "elastic_ip_names" {
  type        = list(string)
  description = "Names for the Elastic IPs"
}

# Variable for specifying the names of the NAT Gateways
variable "nat_gateway_names" {
  type        = list(string)
  description = "Names for the Nat Gateways"
}

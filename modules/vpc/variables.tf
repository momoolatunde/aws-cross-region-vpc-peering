# Variable for defining the name of the VPC
variable "vpc_name" {
  description = "The name of the VPC."
  type        = string
}

# Variable for defining the CIDR block for the main VPC
variable "vpc_cidr_block" {
  type        = string
  description = "The CIDR block for the VPC."
}

# Variable for defining the region where resources will be created
variable "region" {
  description = "The AWS region where resources will be created."
  type        = string
}

# Variable for defining the CIDR blocks for public subnets within the VPC
variable "subnet_cidr_block" {
  type        = list(string)
  description = "The CIDR block for the public subnets."
}

# Variable for defining the CIDR blocks for web subnets within the VPC
variable "web_subnet_cidr_block" {
  type        = list(string)
  description = "The CIDR block for the web subnets."
}

# Variable for defining the CIDR blocks for database subnets within the VPC
variable "database_subnet_cidr_block" {
  type        = list(string)
  description = "The CIDR block for the database subnets."
}

# Variable for specifying names of the public subnets
variable "subnet_names" {
  type        = list(string)
  description = "List of names for the public subnets."
  default     = ["PublicSubnet1", "PublicSubnet2"]
}

# Variable for specifying names of the web subnets
variable "web_subnet_names" {
  type        = list(string)
  description = "List of names for the web subnets."
  default     = ["WebSubnet1", "WebSubnet2"]
}

# Variable for specifying names of the database subnets
variable "database_subnet_names" {
  type        = list(string)
  description = "List of names for the database subnets."
  default     = ["DatabaseSubnet1", "DatabaseSubnet2"]
}

# Defines a map of global tags for resource tagging
variable "global_tags" {
  description = "A map of tags to be applied to all resources."
  type        = map(string)
}

# Variable for storing the list of NAT Gateway IDs
variable "nat_gateway_ids" {
  description = "List of NAT Gateway IDs"
  type        = list(string)
}
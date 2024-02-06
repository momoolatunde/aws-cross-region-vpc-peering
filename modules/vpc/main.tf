# -- Virtual Private Cloud -- #

# Resource for creating the Main VPC with specified CIDR block
resource "aws_vpc" "main_vpc" {
  cidr_block           = var.vpc_cidr_block
  instance_tenancy     = "default"
  enable_dns_hostnames = true
  enable_dns_support   = true

  tags = merge(
    var.global_tags,
    {
      Name        = var.vpc_name,
      Description = "Main VPC in ${var.region} region"
    }
  )
}

# -- Internet Gateway -- #

# Resource for creating an Internet Gateway attached to the VPC
resource "aws_internet_gateway" "internet_gateway" {
  vpc_id = aws_vpc.main_vpc.id

  tags = merge(
    var.global_tags,
    {
      Name        = "MainVPC-IGW",
      Description = "Internet Gateway in ${var.region} region"
    }
  )
}

# -- Subnets -- #

# Subnet resource for creating multiple public subnets
resource "aws_subnet" "subnets" {
  count                   = length(var.subnet_cidr_block)
  vpc_id                  = aws_vpc.main_vpc.id
  cidr_block              = var.subnet_cidr_block[count.index]
  availability_zone       = data.aws_availability_zones.available.names[count.index]
  map_public_ip_on_launch = true

  tags = merge(
    var.global_tags,
    {
      Name        = var.subnet_names[count.index]
      Type        = "Public"
      Description = "Public Subnets in ${var.region} region"
    }
  )
}

# Route table for managing traffic routing within the VPC
resource "aws_route_table" "route_table" {
  vpc_id = aws_vpc.main_vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.internet_gateway.id
  }

  tags = merge(
    var.global_tags,
    {
      Name        = "PublicRouteTable"
      Description = "Route table for public subnets in ${var.region} region"
    }
  )
}

# Association of public subnets with the public route table
resource "aws_route_table_association" "route_table_association" {
  count          = length(var.subnet_cidr_block)
  subnet_id      = aws_subnet.subnets[count.index].id
  route_table_id = aws_route_table.route_table.id
}

# -- Web Subnets -- #

# Subnet resource for creating private web subnets
resource "aws_subnet" "web_subnets" {
  count                   = length(var.web_subnet_cidr_block)
  vpc_id                  = aws_vpc.main_vpc.id
  cidr_block              = var.web_subnet_cidr_block[count.index]
  availability_zone       = data.aws_availability_zones.available.names[count.index]
  map_public_ip_on_launch = false

  tags = merge(
    var.global_tags,
    {
      Name        = var.web_subnet_names[count.index]
      Type        = "Private"
      Description = "Private web subnets in ${var.region} region"
    }
  )
}

# -- Database Subnets -- #

# Subnet resource for creating private database subnets
resource "aws_subnet" "database_subnets" {
  count                   = length(var.database_subnet_cidr_block)
  vpc_id                  = aws_vpc.main_vpc.id
  cidr_block              = var.database_subnet_cidr_block[count.index]
  availability_zone       = data.aws_availability_zones.available.names[count.index]
  map_public_ip_on_launch = false

  tags = merge(
    var.global_tags,
    {
      Name        = var.database_subnet_names[count.index]
      Type        = "Private"
      Description = "Private database subnets in ${var.region} region"
    }
  )
}

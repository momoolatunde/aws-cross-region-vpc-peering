# Initiates a VPC peering connection
resource "aws_vpc_peering_connection" "peering" {
  provider = aws.requester

  vpc_id         = var.requester_vpc_id
  peer_vpc_id    = var.accepter_vpc_id
  peer_region    = var.peer_region
  auto_accept    = false

  tags = merge(
    var.global_tags,
    {
      "Name" = "VPC Peering between ${var.requester_region_name} and ${var.accepter_region_name}"
    }
  )
}

# Accepts a VPC peering connection
resource "aws_vpc_peering_connection_accepter" "peering_accepter" { 
  provider = aws.accepter
  count                      = var.auto_accept ? 1 : 0
  vpc_peering_connection_id = aws_vpc_peering_connection.peering.id
  auto_accept                = true
  tags = merge(
    var.global_tags,
    {
      Name        = "VPC Peering Connection Accepter",
      Description = "Accepts VPC Peering Connection"
    }
  )
}

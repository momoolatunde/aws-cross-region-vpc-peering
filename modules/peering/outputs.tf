# Outputs the ID of the established VPC peering connection
output "peering_connection_id" {
  description = "The ID of the VPC peering connection."
  value       = aws_vpc_peering_connection.peering.id
}

# Provides the current status of the VPC peering connection
output "peering_connection_status" {
  description = "The status of the VPC peering connection."
  value       = aws_vpc_peering_connection.peering.accept_status
}

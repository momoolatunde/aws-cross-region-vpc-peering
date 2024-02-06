# ID of the VPC initiating the peering request.
variable "requester_vpc_id" {
  description = "The ID of the requester VPC."
  type        = string
}

# ID of the VPC to which the peering request is sent.
variable "accepter_vpc_id" {
  description = "The ID of the accepter VPC."
  type        = string
}

# Region where the accepter VPC resides.
variable "peer_region" {
  description = "The region of the accepter VPC."
  type        = string
  default     = ""
}

# Controls if the peering connection is automatically accepted.
variable "auto_accept" {
  description = "Whether the peering connection should be automatically accepted."
  type        = bool
  default     = false
}

# Defines a map of global tags for resource tagging
variable "global_tags" {
  description = "A map of tags to be applied to all resources."
  type        = map(string)
}

# Define variable for the name of the requester region.
variable "requester_region_name" {
  description = "The name of the requester region."
  type        = string
}

# Define variable for the name of the accepter region.
variable "accepter_region_name" {
  description = "The name of the accepter region."
  type        = string
}
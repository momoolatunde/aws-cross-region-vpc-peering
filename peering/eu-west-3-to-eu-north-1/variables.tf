# Defines a map of global tags for resource tagging
variable "global_tags" {
  description = "A map of tags to be applied to all resources."
  type        = map(string)
}

# Variable for requester region's name.
variable "requester_region_name" {
  description = "The name of the requester region."
  type        = string
}

# Variable for accepter region's name.
variable "accepter_region_name" {
  description = "The name of the accepter region."
  type        = string
}

# Variable for peer region's name.
variable "peer_region" {
  description = "The name of the peer region."
  type        = string
}

# Variable for AWS requester region.
variable "requester_region" {
  description = "The name of the requester region."
  type        = string
}

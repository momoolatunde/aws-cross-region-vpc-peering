# Fetches the list of all available AWS Availability Zones in the current region
data "aws_availability_zones" "available" {
  state = "available"
}

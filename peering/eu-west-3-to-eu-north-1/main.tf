# VPC peering between ParisVPC (eu-west-3) and StockholmVPC (eu-north-1)
module "vpc_peering_eu_west_3_to_eu_north_1" {
  source = "../../modules/peering"
  
  providers = {
    aws.requester = aws.requester
    aws.accepter  = aws.accepter
  }

  requester_vpc_id       = data.terraform_remote_state.eu_west_3.outputs.vpc_id
  accepter_vpc_id        = data.terraform_remote_state.eu_north_1.outputs.vpc_id
  peer_region            = "eu-north-1"
  auto_accept            = true
  requester_region_name  = var.requester_region_name
  accepter_region_name   = var.accepter_region_name

  global_tags = merge(
    var.global_tags,
    {
      Name        = "ParisVPC-StockholmVPC",
      Description = "Peering between ParisVPC and StockholmVPC"
    }
  )
}

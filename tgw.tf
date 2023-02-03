resource "aws_ec2_transit_gateway" "tgw" {
  description = "TGW for region1"
  tags = {
    Name = "transit-gateway-for-region1"
  }
  provider = aws.region1
}

resource "aws_route" "route1_to_tgw" {
    for_each = toset(["10.2.0.0/16","10.3.0.0/16"])
    destination_cidr_block = each.value
    transit_gateway_id = aws_ec2_transit_gateway.tgw.id
    route_table_id = module.vpc1.public_route_table_ids[0]
}

resource "aws_ec2_transit_gateway_vpc_attachment" "tgw_vpc1" {
  subnet_ids         = module.vpc1.public_subnets
  transit_gateway_id = aws_ec2_transit_gateway.tgw.id
  vpc_id             = module.vpc1.vpc_id
  provider = aws.region1
}

#resource "aws_route" "route2_to_tgw" {
#  for_each = toset(["10.1.0.0/16","10.3.0.0/16"])
#  destination_cidr_block = each.value
#  transit_gateway_id = aws_ec2_transit_gateway.tgw.id
#  route_table_id = module.vpc2.public_route_table_ids[0]
#  provider = aws.region1
#}
#
#resource "aws_route" "route3_to_tgw" {
#  for_each = toset(["10.1.0.0/16","10.3.0.0/16"])
#  destination_cidr_block = each.value
#  transit_gateway_id = aws_ec2_transit_gateway.tgw.id
#  route_table_id = module.vpc3.public_route_table_ids[0]
#  provider = aws.region1
#}
#
#resource "aws_ec2_transit_gateway_vpc_attachment" "tgw_vpc2" {
#  subnet_ids         = module.vpc2.public_subnets
#  transit_gateway_id = aws_ec2_transit_gateway.tgw.id
#  vpc_id             = module.vpc2.vpc_id
#  provider = aws.region1
#}
#
#resource "aws_ec2_transit_gateway_vpc_attachment" "tgw_vpc3" {
#  subnet_ids         = module.vpc3.public_subnets
#  transit_gateway_id = aws_ec2_transit_gateway.tgw.id
#  vpc_id             = module.vpc3.vpc_id
#  provider = aws.region1
#}
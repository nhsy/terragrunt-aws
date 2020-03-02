###
# Create vpc
###
module "vpc" {
  source  = "terraform-aws-modules/vpc/aws"
  version = "2.24.0"

  # Create subnets across 3 AZs, if the region has less than 3 AZ's this will fail.
  # It is recommended to use a minimum of 3 AZs, so use another region.
  azs = [
    data.aws_availability_zones.azs.names[0],
    data.aws_availability_zones.azs.names[1],
    data.aws_availability_zones.azs.names[2]
  ]
  cidr                     = var.network_cidr
  igw_tags                 = map("Name", local.igw_name)
  enable_dns_hostnames     = true
  name                     = local.vpc_name
  private_route_table_tags = map("Name", local.private_route_table_name)
  public_route_table_tags  = map("Name", local.public_route_table_name)

  public_subnets = [
    cidrsubnet(var.network_cidr, 8, 0),
    cidrsubnet(var.network_cidr, 8, 1),
    cidrsubnet(var.network_cidr, 8, 2)
  ]

  private_subnets = [
    cidrsubnet(var.network_cidr, 8, 8),
    cidrsubnet(var.network_cidr, 8, 9),
    cidrsubnet(var.network_cidr, 8, 10)
  ]

  ###
  # Create single nat gateway for outbound traffic from internal servers
  ###
  enable_nat_gateway     = true
  single_nat_gateway     = true
  one_nat_gateway_per_az = false

  tags = var.common_tags
}


locals {
  igw_name = format("%s-%s", "igw", var.random_id)

  mgmt_source_cidr = distinct(concat([
  local.mgmt_ip], var.mgmt_source_cidr))
  mgmt_ip = "${chomp(data.http.mgmt_ip.body)}/32"

  private_route_table_name = format("%s-%s-%s", "rt", var.random_id, "private")
  public_route_table_name  = format("%s-%s-%s", "rt", var.random_id, "public")
  vpc_name                 = format("%s-%s", var.vpc_prefix, var.random_id)
}
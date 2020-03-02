output "vpc_name" {
  value = module.vpc.name
}

output "vpc_id" {
  value = module.vpc.vpc_id
}

output "private_subnets_cidr_blocks" {
  value = module.vpc.private_subnets_cidr_blocks
}

output "private_subnets" {
  value = module.vpc.private_subnets
}

output "public_subnets_cidr_blocks" {
  value = module.vpc.public_subnets_cidr_blocks
}

output "public_subnets" {
  value = module.vpc.public_subnets
}

output "azs" {
  value = module.vpc.azs
}

output "sg_remote_mgmt_id" {
  value = aws_security_group.remote_mgmt.id
}

output "sg_bastion_hosts_id" {
  value = aws_security_group.bastion_hosts.id
}

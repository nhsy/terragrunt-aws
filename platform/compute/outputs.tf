output "bastion_private_ip" {
  value = module.bastion.private_ip[0]
}

output "bastion_public_ip" {
  value = module.bastion.public_ip[0]
}

output "bastion_name" {
  value = module.bastion.tags[0]["Name"]
}

output "bastion_az" {
  value = module.bastion.availability_zone[0]
}
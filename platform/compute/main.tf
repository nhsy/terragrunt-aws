###
# Create bastion EC2 instance
###
module "bastion" {
  source                      = "terraform-aws-modules/ec2-instance/aws"
  version                     = "2.12"
  ami                         = data.aws_ami.amazon.id
  cpu_credits                 = "standard"
  associate_public_ip_address = true
  key_name                    = var.ssh_key_name
  instance_type               = var.instance_type
  name                        = local.bastion_name
  root_block_device           = [{ delete_on_termination = true }]
  subnet_id                   = var.public_subnets[0]
  tags                        = var.common_tags
  user_data                   = data.template_file.bastion.rendered
  volume_tags                 = var.common_tags
  vpc_security_group_ids      = [var.sg_remote_mgmt_id, var.sg_bastion_hosts_id]
}

locals {
  bastion_name = format("bastion-%s", var.random_id)
}


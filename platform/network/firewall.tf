resource "aws_security_group" "remote_mgmt" {
  name        = format("%s-%s", "remote-mgmt", var.random_id)
  description = "remote-mgmt"
  vpc_id      = module.vpc.vpc_id
  egress {
    from_port = 0
    to_port   = 0
    protocol  = "-1"
    cidr_blocks = [
    "0.0.0.0/0"]
  }

  tags = merge(
    map("Name", format("%s-%s", "remote-mgmt", var.random_id)),
    var.common_tags
  )
}

resource "aws_security_group_rule" "remote_mgmt_ssh" {
  cidr_blocks       = local.mgmt_source_cidr
  description       = "Allow SSH remote mgmt"
  from_port         = 22
  protocol          = "tcp"
  security_group_id = aws_security_group.remote_mgmt.id
  to_port           = 22
  type              = "ingress"
}

resource "aws_security_group" "bastion_hosts" {
  name        = format("%s-%s", "bastion-hosts", var.random_id)
  description = "Bastion hosts group"
  vpc_id      = module.vpc.vpc_id

  tags = merge(
    map("Name", format("%s-%s", "bastion-hosts", var.random_id)),
    var.common_tags
  )
}

resource "aws_security_group" "bastion_mgmt" {
  name        = format("%s-%s", "bastion-mgmt", var.random_id)
  description = "Allow bastion mgmt"
  vpc_id      = module.vpc.vpc_id

  egress {
    from_port = 0
    to_port   = 0
    protocol  = "-1"
    cidr_blocks = [
    "0.0.0.0/0"]
  }
  tags = merge(
    map("Name", format("%s-%s", "bastion-mgmt", var.random_id)),
    var.common_tags
  )
}

resource "aws_security_group_rule" "bastion-mgmt-ssh" {
  description              = "Allow SSH from bastion"
  from_port                = 22
  protocol                 = "tcp"
  security_group_id        = aws_security_group.bastion_mgmt.id
  source_security_group_id = aws_security_group.bastion_hosts.id
  to_port                  = 22
  type                     = "ingress"
}

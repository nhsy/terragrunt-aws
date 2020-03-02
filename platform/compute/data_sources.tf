data "aws_ami" "amazon" {
  most_recent = true
  owners      = ["amazon"]

  filter {
    name   = "name"
    values = ["amzn2-ami-hvm*"]
  }
}

# bastion user data
data "template_file" "bastion" {
  template = file("files/bastion_userdata.sh")
}

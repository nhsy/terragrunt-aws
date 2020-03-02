variable "vpc_id" {
  type        = string
  description = "VPC ID"
}

variable "private_subnets" {
  type = list(string)
  description = "Private subnet id's"
}

variable "public_subnets" {
  type = list(string)
  description = "Public subnet id's"
}

variable "region" {
  type        = string
  description = "Region to create resources"
}

variable "random_id" {
  type        = string
  description = "Random ID string"
}

variable "common_tags" {
  type    = map(string)
  default = {}
  description = "Common tags for resources"
}

variable "instance_type" {
  type    = string
  default = "t3.micro"
  description = "EC2 instance type"
}

variable "ssh_key_name" {
  type = string
  description = "SSH key pair name"
}

variable "sg_remote_mgmt_id" {
  type = string
  description = "Remote management security group"
}

variable "sg_bastion_hosts_id" {
  type = string
  description = "Bastion hosts security group"
}

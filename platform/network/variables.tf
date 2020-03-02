variable "random_id" {
  type        = string
  description = "Random ID string"
}

variable "vpc_prefix" {
  type        = string
  default     = "vpc"
  description = "VPC name prefix"
}

variable "network_cidr" {
  type        = string
  default     = "10.128.0.0/16"
  description = "Network CIDR"
}

variable "region" {
  type        = string
  description = "Region to create resources"
}

variable "create_nat_gateway" {
  type        = bool
  default     = false
  description = "Create nat gatway for internal servers"
}

variable "mgmt_source_cidr" {
  type        = list(string)
  default     = []
  description = "Management CIDR for remote access"
}

variable "common_tags" {
  type    = map(string)
  default = {}
}

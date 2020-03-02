variable "region" {
  type = string
  description = "Region for resources"
}

variable "environment" {
  type        = string
  default     = "dev"
  description = "Environment name"
}

variable "creator" {
  type        = string
  description = "Creator name"
}

variable "business_name" {
  type = string
}

variable "cost_code" {
  type = string
}

variable "project_id" {
  type = string
}

variable "project_name" {
  type = string
}

variable "project_sponsor" {
  type = string
}

variable "project_technical_lead" {
  type = string
}

variable "ssh_public_key" {
  type = string
  description = "SSH public key"
}

variable "ssh_key_name_prefix" {
  type = string
  description = "SSH key name prefix"
}

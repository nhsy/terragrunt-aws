###
# Generate random id to append to every created resource name
###
resource "random_id" "this" {
  byte_length = 3
}

###
# Create common tags
###
module "common_tags" {
  source = "../../modules/aws-tags"

  project_id             = var.project_id
  environment            = var.environment
  creator                = var.creator
  project_name           = var.project_name
  business_name          = var.business_name
  cost_code              = var.cost_code
  project_sponsor        = var.project_sponsor
  project_technical_lead = var.project_technical_lead
  review_date            = replace(substr(timeadd(timestamp(), "168h"), 0, 10), "-", "")
}

###
# Create AWS SSH key pair using public key
###
resource "aws_key_pair" "ssh_key" {
  key_name   = local.ssh_key_name
  public_key = var.ssh_public_key
}

locals {
  ssh_key_name = format("%s-%s", var.ssh_key_name_prefix, random_id.this.hex)
}

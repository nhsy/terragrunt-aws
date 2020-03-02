locals {
  common_tags = {
    business-name          = lower(var.business_name)
    cost-code              = lower(var.cost_code)
    creator                = lower(var.creator)
    environment            = lower(var.environment)
    project-id             = lower(var.project_id)
    project-name           = lower(var.project_name)
    project-sponsor        = lower(var.project_sponsor)
    project-technical-lead = lower(var.project_technical_lead)
    state                  = lower(var.state)
    terraform              = true
    workspace              = lower(terraform.workspace)
  }
}

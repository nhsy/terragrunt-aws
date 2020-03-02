# terragrunt-aws

The aim of this repo is to provide familiarisation with the AWS cloud environment, terraform and terragrunt.

## Development Environment
Preferred software and platform are described below:
* AWS CLI
* IntelliJ or VSCode
* Git
* Terraform
* Terraform-docs
* Terragrunt

## Platform
A native bash shell provides the best user experience.
* Linux
* MacOS
* Windows with Docker or WSL

## Authentication
Terraform requires AWS PROFILE exported as follows:
```shell script
export AWS_PROFILE=[profile]
```

# Resources
The terraform code deploys the following resources:

* Bastion EC2 instance
* Firewall rules to allow SSH ingress
* VPC with Public and Private Subnets

# Usage
## Pre-requisites
Create the file named common/common.tfvars and populate variables accordingly.
```hcl
region                  = "eu-west-2"
project_id              = "project-id"
project_name            = "project-name"
project_sponsor         = "joe-bloggs"
project_technical_lead  = "joe-bloggs"
cost_code               = "123456"
business_name           = "dept-1"
creator                 = "owner"
ssh_key_name_prefix     = "joe-bloggs"
ssh_public_key          = "ssh-rsa AAAA..."
```

Export the variables below in your shell:
```shell script
export TG_BUCKET=     # Name of the Terraform State Bucket to create
export TG_PROJECT=    # Project ID of the Terraform State Bucket to create
export TG_REGION=     # REGION of the Terraform State Bucket to create
```

## Deployment
Execute the commands below from the [platform](platform) directory.
```shell script
terragrunt plan-all
terragrunt apply-all
```

## Destruction
Execute the commands below from the [platform](platform) directory.
```shell script
terragrunt destroy-all
```

# Tests
Execute the commands below from the [platform](platform) directory.

## SSH to the EC2 instance
The command below creates a SSH session to the bastion compute instance over the public ip address.
```shell script
ssh ec2-user@$(cd compute && terraform output bastion_public_ip) -i [ssh-key-path]
```

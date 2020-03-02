remote_state {
  backend = "s3"
  config = {
    bucket         = get_env("TG_BUCKET", "terragrunt-tfstate")
    key            = "${path_relative_to_include()}/terraform.tfstate"
    region         = get_env("TG_REGION", "eu-west-2")
    encrypt        = true
    dynamodb_table = get_env("TG_LOCK", "terragrunt-tflock")
  }
}

terraform {
  extra_arguments "common_vars" {
    commands = get_terraform_commands_that_need_vars()
    arguments = [
      "-var-file=${get_parent_terragrunt_dir()}/../common/common.tfvars"
    ]
  }

  extra_arguments "parallelism" {
    commands = get_terraform_commands_that_need_parallelism()
    arguments = [
      "-parallelism=20"
    ]
  }

  before_hook "provider" {
    commands = ["init"]
    execute  = ["cp", "${get_parent_terragrunt_dir()}/../common/providers.tf", "."]
  }
}

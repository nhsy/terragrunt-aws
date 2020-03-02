include {
  path = find_in_parent_folders()
}

dependency "bootstrap" {
  config_path = "../bootstrap"
  mock_outputs = {
    random_id = "12345"
    common_tags = {
      "mock_tag" = "mock_tag"
    }
    ssh_key_name = "mock_ssh_key_name"
  }
}

dependency "network" {
  config_path = "../network"
  mock_outputs = {
    private_subnets     = ["mock_private_subnet"]
    public_subnets      = ["mock_public_subnet"]
    vpc_id              = "mock_vpc_id"
    sg_bastion_hosts_id = "mock_sg_bastion_hosts_id"
    sg_remote_mgmt_id   = "mock_sg_remote_mgmt_id"
  }
}

inputs = {
  random_id           = dependency.bootstrap.outputs.random_id
  common_tags         = dependency.bootstrap.outputs.common_tags
  vpc_id              = dependency.network.outputs.vpc_id
  private_subnets     = dependency.network.outputs.private_subnets
  public_subnets      = dependency.network.outputs.public_subnets
  ssh_key_name        = dependency.bootstrap.outputs.ssh_key_name
  sg_bastion_hosts_id = dependency.network.outputs.sg_bastion_hosts_id
  sg_remote_mgmt_id   = dependency.network.outputs.sg_remote_mgmt_id
}

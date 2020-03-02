include {
  path = find_in_parent_folders()
}

dependency "bootstrap" {
  config_path = "../bootstrap"
  mock_outputs = {
    random_id   = "12345"
    common_tags = { "mock_tag" = "mock_tag" }
  }

}

inputs = {
  random_id   = dependency.bootstrap.outputs.random_id
  common_tags = dependency.bootstrap.outputs.common_tags
}

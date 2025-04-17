resource "tfe_policy_set" "ebs" {
  agent_enabled       = true
  global              = true
  kind                = "sentinel"
  name                = "ebs-encryption"
  organization        = var.organization
  overridable         = true
  policy_tool_version = "latest"
  vcs_repo {
    branch                     = null
    github_app_installation_id = "ghain-gurYHzDBdnByPE5g"
    identifier                 = "drewmullen/demo-sentinel-policies"
    ingress_submodules         = false
    oauth_token_id             = null
  }
}

resource "tfe_policy_set_parameter" "prod" {
  key          = "protected_envs"
  value        = "[\"prod\"]"
  policy_set_id = tfe_policy_set.ebs.id
}


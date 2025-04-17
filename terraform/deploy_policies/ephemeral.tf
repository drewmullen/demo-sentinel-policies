resource "tfe_policy_set" "ephemerality" {
  agent_enabled       = true
  global              = true
  kind                = "sentinel"
  name                = "ephemerality"
  organization        = var.organization
  overridable         = true
  policy_tool_version = "latest"
  vcs_repo {
    github_app_installation_id = "ghain-gurYHzDBdnByPE5g"
    identifier                 = "drewmullen/policy-library-ephemerality"
    ingress_submodules         = false
  }
}

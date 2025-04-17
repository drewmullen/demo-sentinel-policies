## Tag based assignment

Using tags on workspaces or projects to assign policies

### Using `tfe_policy_set.workspace_ids`

pro/con:
- + single api call (no rate limiting)
- - "fully managed": cannot add workspaces in GUI or with `tfe_workspace_policy_set` in this or any other root
- -/+ assignment time based tag evaluation 
- - must run policy set assignment when workspace created

```hcl
resource "tfe_policy_set" "prod" {
  name = "prod"
  organization = var.organization
  description = "Policy set for prod workspaces"
  policy_ids = [
    tfe_policy.always_true.id
  ]
  workspace_ids = values(data.tfe_workspace_ids.prod.ids)
}

data "tfe_workspace_ids" "prod" {
  organization = var.organization
  tag_names = [
    "prod"
  ]
}
```

### Using  `tfe_workspace_policy_set`:

pro/con:
- + you can set a workspace ID to a policy set in any number of roots
- - will hit rate limit 
- -/+ assignment time based tag evaluation 

```
data "tfe_workspace_ids" "prod" {
  organization = var.organization
  tag_names = [
    "prod"
  ]
}

resource "tfe_workspace_policy_set" "looped" {
  for_each = data.tfe_workspace_ids.prod.ids
  policy_set_id = tfe_policy_set.prod.id
  workspace_id = each.value
}
```

## Sentinel Policy 

pro/con:
- - requires custom policies
- - difficult for users to understand policy exposure
- - all policies will show as run every time
- - policy evaluation time increased?
- -/+ point in time tag evaluation
+ + very difficult to circumvent


Relevant tag info from `tfrun`mock:
```hcl
workspace = {
# ... non tag info removed

"tag_bindings": [
  {
    "inherited": true,
    "key": "prodproject",
    "value": null,
  },
  {
    "inherited": false,
    "key": "prod",
    "value": null,
  },
],
  "tags": [
    "prodproject",
    "prod",
  ],
}
```

Policy:
```
param protected_envs default [
  "prod",
]

env_violations = filter tfrun.workspace.tags as tag {
  tag in protected_envs
}

not_in_enforced_env = rule {
  length(env_violations) == 0
}

main = rule {
  not_in_enforced_env or
  # other policy rules
}
```
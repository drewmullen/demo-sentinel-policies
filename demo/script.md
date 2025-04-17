# Demo - Sentinel Overview

AGENDA:
- Overview of policy concepts
- Managing policies in TFC
- Enforcing policies in TFC

Not:
- A deep dive on how to write sentinel policies
- Migration enforcement behaviors (although we can discuss if we have time)

## Policy Basics

_pull up code repo_

policy vs policy set

review: 
- primitives sentinel.hcl
- sample policy
- mocks
- modules

Introduce actual policies
- review policies
- deploy
- show case a failure

## Requirements
- `sentinel.hcl` - maps to a policy set
	- imports 
	- policy statements
	- modules
### Policy  statements

policy sources are similar to modules. you can tell where they come from by examining the source

- Custom policies 
- Library policies
 
- Parameters

import

## Managing Policies in TFC

_pull up policies page in org_

Sentinel allows for many ways to associate policies with a terraform run. For a policy to run in a TFC org it must be apart of a policy set and the policy set must be enforced on the workspace. Policies can be assigned to a policy set in a few ways:
- Individually managed policies statically defined (example: `tfe_policy` resource) and attached to a _individually managed_ policy set
- VCS integration
- API workflow

You cannot mix management strategies on a policy set but you can have different policies sets that use different management strategies.
## Individually Managed Policies 

Individually managed policies are not popular and we'll spend no more time on them

## VCS Integration

With VCS integration you can connect a policy set definition directly to a VCS repo. Policies are cloned from the repo during a run. 


## API Workflow

Similar to modules and config versions, sentinel policy set definitions can be pushed via API

# Enforcing Policies in TFC

Policy sets are enforced by their settings:
- globally (exceptions allowed)
- by project
- by workspace

They can be scoped / attached to objects via:
- GUI
- terraform
	- tfe_policy_set
	- tfe_workspace_policy_set

 Tags:
 Tags can be assigned to projects or workspaces. Tags on projects are "inherited" by workspaces. 
 - You can scan your TFC with a data source and filter based on tags, then assign policy sets accordingly. 
 - Alternatively you can write policies that always run but pass based on tags assigned at run (fungible)


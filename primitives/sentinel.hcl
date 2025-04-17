import "module" "is_var" {
    source = "./modules/is_var.sentinel"
}

policy "sample-policy" {
  source = "./sample-policy.sentinel"
  enforcement_level = "hard-mandatory"
}

policy "cloudtrail-cloudwatch-logs-group-arn-present" {
  source = "https://registry.terraform.io/v2/policies/hashicorp/CIS-Policy-Set-for-AWS-Terraform/1.0.1/policy/cloudtrail-cloudwatch-logs-group-arn-present.sentinel?checksum=sha256:889632628547ffd5139c557b3f8403f50f821c36220ada5898656a8c345ed96f"
  enforcement_level = "advisory"
}
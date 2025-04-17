resource "tls_private_key" "test" {
  algorithm = "RSA"
  rsa_bits  = 4096
}

provider "aws" {
    region = "us-east-1"
}

terraform {
  cloud {
    organization = "mullen-hashi"
    workspaces {
      project = "demo-sentinel"
      name = "sentinel-ephemeral-fail"
    }
  }
}

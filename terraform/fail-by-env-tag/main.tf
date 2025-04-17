resource "aws_ebs_volume" "example" {
  availability_zone = "us-east-1a"
  size              = 40
  encrypted = false
  
  tags = {
    Name = "prod-env-fail"
  }
}

terraform {
  cloud {
    organization = "mullen-hashi"
    workspaces {
      project = "demo-sentinel"
      name = "sentinel-create-fail-env"
    }
  }
}

provider "aws" {
  region = "us-east-1"
}

variable "organization" {}
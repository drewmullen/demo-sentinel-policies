resource "aws_ebs_volume" "example" {
  availability_zone = "us-east-1a"
  size              = 40
  encrypted = false
  
  tags = {
    Name = "HelloWorldCreate"
  }
}

terraform {
  cloud {
    organization = var.organization
    workspaces {
      project = "demo-sentinel"
      name = "sentinel-create-fail"
    }
  }
}

variable "organization" {}
provider "aws" {
  region = "us-east-1"
}
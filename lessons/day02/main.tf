terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "~> 6.23.0"
    }
  }
}

provider "aws" {
  # Configuration options
  region = "ca-central-1"
}

resource "aws_vpc" "main" {
  cidr_block = "10.0.0.0/16"
}

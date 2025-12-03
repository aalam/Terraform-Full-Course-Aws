terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "6.16.0"
    }
  }
}

provider "aws" {
  region = tolist(var.availability_zones)[0]

  default_tags {
    tags = {
      Project     = "Terraform-Full-Course-AWS"
      Day         = "07"
      Topic       = "Type-Constraints"
      ManagedBy   = "Terraform"
      Environment = var.environment
    }
  }
}

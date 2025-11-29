terraform {
  backend "s3" {
    bucket = "nov2025bucket-terraform-state"
    key    = "dev/terraform.tfstate"
    region = "ca-central-1"
    encrypt = true
    use_lockfile = true
  }
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "~> 6.0"
    }
  }
} 

provider "aws" {
  # Configuration options
    region = "ca-central-1"
}


#Create S3 bucket
resource "aws_s3_bucket" "tf_test_bucket" {
 bucket = "techlearnswitch-alam-bucket"

  tags = {
    Name        = "Aman bucket 2.0"
    Environment = "Dev"
  }
}
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

variable "environment" {
    default = "dev"
    type = string
}

variable "channel_name" {
    default = "ttwp"
  
}

variable "region" {
    default = "ca-central-1"
  
}

locals {
  env = var.environment
  bucket_name = "${var.channel_name}-bucket-${var.environment}-${var.region}"
  vpc_name = "${var.environment}-VPC"
}

#Create S3 bucket
resource "aws_s3_bucket" "frist_bucket" {
 bucket = "techlearnswitch-alam-bucket"

  tags = {
    Name        = local.bucket_name
    Environment = var.environment
  }
}

resource "aws_vpc" "sample" {
    cidr_block = "10.0.1.0/24"
    region = var.region
    tags = {
        Enviornment = var.environment
        Name = "${var.environment}-VPC"
    }
}

resource "aws_instance" "example" {
ami = "ami-04302d6f32dc7f75d"
instance_type = "t3.micro"
#subnet_id = aws_subnet.sample.subnet_id
tags = {
    Enviornment = var.environment
    Name = "${var.environment}-EC2-Instance"
}

}

output "vpc_id" {
  value = aws_vpc.sample.id
}

output "ec2_id" {
    value = aws_instance.example.id
}
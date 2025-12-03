terraform {
    backend "s3" {
    bucket = "nov2025bucket-terraform-state"
    key    = "dev/terraform.tfstate"
    region = "ca-central-1"
    encrypt = true
    use_lockfile = true
  }
}
provider "aws" {
  region = "eu-central-1"
}

terraform {
  backend "s3" {
    bucket = "mid.project.tfstate.file"
    key    = "terraform/blue/terraform.tfstate"
    region = "eu-central-1"
  }
}

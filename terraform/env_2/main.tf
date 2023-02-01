provider "aws" {
  region = "eu-central-1"
}

terraform {
  backend "s3" {
    bucket = "mid.project.tfstate.file"
    key    = "terraform/env_2/terraform.tfstate"
    region = "eu-central-1"
  }
}

data "terraform_remote_state" "admin" {
  backend = "s3"
  config = {
    bucket = "mid.project.tfstate.file"
    key    = "terraform/admin/terraform.tfstate"
    region = "eu-central-1"
  }
}

module "env_2" {
  source           = "git@github.com:unicum0212/terraform-modules.git//lb_and_asg"
  min_size         = 1
  max_size         = 2
  min_elb_capacity = 1
}

output "dns_name_env_2" {
  value = module.env_2.dns_name_env_1
}


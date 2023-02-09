provider "aws" {
  region = "eu-central-1"
}

variable "status" {
  default = "Clean"
}

terraform {
  backend "s3" {
    bucket = "mid.project.tfstate.file"
    key    = "terraform/env_1/terraform.tfstate"
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

module "env_1" {
  source           = "git@github.com:unicum0212/terraform-modules.git//lb_and_asg"
  min_size         = 1
  max_size         = 2
  min_elb_capacity = 1
  status           = var.status
}

output "dns_name_env_1" {
  value = module.env_1.dns_name_env_1
}

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
  source    = "git@github.com:unicum0212/terraform-modules.git//environments"
  env       = "green"
  sec_group = data.terraform_remote_state.admin.outputs.petclinic_sg_prod
}

output "env_2_public_ip" {
  value = module.env_2.env_server_public_ip
}

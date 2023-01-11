data "aws_availability_zones" "avalilable" {}

data "aws_ami" "latest_ubuntu" {
  owners      = ["099720109477"]
  most_recent = true
  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-focal-20.04-amd64-server-*"]
  }
}

data "aws_route53_zone" "public" {
  name = "devdimaops.tech"
}

/*
data "aws_ssm_parameter" "rds_password" {
  name = "/prod/mysql/password"
  depends_on = [
    aws_ssm_parameter.rds_password
  ]
}

data "aws_ssm_parameter" "rds_username" {
  name = "/prod/mysql/username"
  depends_on = [
    aws_ssm_parameter.rds_username
  ]
}

*/

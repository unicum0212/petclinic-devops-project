variable "vpc_cidr" {
  default = "10.0.0.0/16"
}

variable "public_subnet_cidrs" {
  default = [
    "10.0.10.0/24",
    "10.0.20.0/24",
    "10.0.30.0/24",
  ]
}

variable "instance_type" {
  default = "t3.micro"
}

variable "keypair" {
  default = "flawwwless-frankfurt"
}
/*
variable "domain_name" {
  default = "petclinic.devdimaops.tech"
}
*/

variable "wildcard" {
  default = "*.devdimaops.tech"
}

module "petclinic_sg_admin" {
  source        = "git@github.com:unicum0212/terraform-modules.git//sec_group"
  ingress_ports = ["80", "8080", "22"]
  vpc_id        = aws_vpc.project_vpc.id
  name          = "Petclinic-Admin-SG"
}

module "petclinic_sg_prod" {
  source        = "git@github.com:unicum0212/terraform-modules.git//sec_group"
  ingress_ports = ["80", "22", "3306", "443"]
  vpc_id        = aws_vpc.project_vpc.id
  name          = "Petclinic-Prod-SG"
}

module "petclinic_sg_lb" {
  source        = "git@github.com:unicum0212/terraform-modules.git//sec_group"
  ingress_ports = ["80", "443"]
  vpc_id        = aws_vpc.project_vpc.id
  name          = "Petclinic-LB-SG"
}

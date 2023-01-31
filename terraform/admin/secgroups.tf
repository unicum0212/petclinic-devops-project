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

/*
resource "aws_security_group" "petclinic_sg_admin" {
  vpc_id = aws_vpc.project_vpc.id
  dynamic "ingress" {
    for_each = ["80", "22", "3306", "5000"]
    content {
      from_port   = ingress.value
      to_port     = ingress.value
      protocol    = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
    }
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "Admin-PetClinic-SG"
  }
}

resource "aws_security_group" "petclinic_sg_prod" {
  dynamic "ingress" {
    for_each = ["80", "22", "3306", "5000"]
    content {
      from_port   = ingress.value
      to_port     = ingress.value
      protocol    = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
    }
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  vpc_id = aws_vpc.project_vpc.id

  tags = {
    Name = "ASG-PetClinic-SG"
  }
}
*/

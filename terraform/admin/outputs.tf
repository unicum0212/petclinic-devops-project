output "petclinic_sg_asg" {
  value = aws_security_group.petclinic_sg_asg.id
}

output "petclinic_sg_lb" {
  value = aws_security_group.petclinic_sg_lb.id
}

output "public_subnet_1" {
  value = aws_subnet.public_subnets[0].id
}

output "public_subnet_2" {
  value = aws_subnet.public_subnets[1].id
}

output "public_subnet_3" {
  value = aws_subnet.public_subnets[2].id
}

/*
output "rds_endpoint" {
  value = aws_db_instance.petclinic_db.address
}
*/

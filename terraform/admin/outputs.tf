output "petclinic_sg_prod" {
  value = module.petclinic_sg_prod.security_group_id
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

output "id_of_vpc" {
  value = aws_vpc.project_vpc.id
}
/*
output "rds_endpoint" {
  value = aws_db_instance.petclinic_db.address
}
*/

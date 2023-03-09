resource "aws_ssm_parameter" "rds_password" {
  name        = "/prod/mysql/password"
  description = "Master Password for RDS MySQL"
  type        = "SecureString"
  value       = "petclinic"
}

resource "aws_ssm_parameter" "rds_username" {
  name        = "/prod/mysql/username"
  description = "Master Username for RDS MySQL"
  type        = "SecureString"
  value       = "petclinic"
}

resource "aws_db_subnet_group" "petclinic_db_subnets" {
  name = "petclinic-sg"
  subnet_ids = [
    aws_subnet.public_subnets[0].id,
    aws_subnet.public_subnets[1].id,
    aws_subnet.public_subnets[2].id,
  ]
  tags = {
    Name = "Petclinic-subgroups"
  }
}

resource "aws_db_instance" "petclinic_db" {
  identifier             = "petclinic-db"
  allocated_storage      = 20
  db_name                = "petclinic"
  engine                 = "mysql"
  engine_version         = "5.7"
  instance_class         = "db.t3.micro"
  username               = data.aws_ssm_parameter.rds_username.value
  password               = data.aws_ssm_parameter.rds_password.value
  parameter_group_name   = "default.mysql5.7"
  skip_final_snapshot    = true
  apply_immediately      = true
  db_subnet_group_name   = aws_db_subnet_group.petclinic_db_subnets.id
  vpc_security_group_ids = [module.petclinic_sg_prod.security_group_id]
}

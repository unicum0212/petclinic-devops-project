resource "aws_instance" "admin_server" {
  ami                    = "ami-0b81e95bb0a06ea8c"
  instance_type          = var.instance_type
  subnet_id              = aws_subnet.public_subnets[2].id
  vpc_security_group_ids = [aws_security_group.petclinic_sg_admin.id]
  root_block_device {
    volume_size = 12
  }
  user_data = file("admin-script.sh")
  key_name  = var.keypair
  tags = {
    Name = "Admin"
  }
}
/*
resource "aws_eip" "admin_eip" {
  instance = aws_instance.admin_server.id
}
*/

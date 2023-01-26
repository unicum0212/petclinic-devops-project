output "env_1_instances" {
  value = aws_elb.petclinic_elb.instances
}

output "dns_name_blue" {
  value = aws_elb.petclinic_elb.dns_name
}

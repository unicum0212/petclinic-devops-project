output "env_2_instances" {
  value = aws_elb.petclinic_elb.instances
}

output "dns_name_green" {
  value = aws_elb.petclinic_elb.dns_name
}

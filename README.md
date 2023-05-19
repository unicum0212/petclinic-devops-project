# mid-level-project
URL: https://petclinic.devdimaops.tech/
![Photo](AWS-infrastructure.png)

## Description
When Commit is triggered, Jenkins on the admin server launches Pipeline, which brings up the Green environment, pulls the application code, tests and deploys it. If the tests were successful, pass the traffic to the Green env.

## Tools
- AWS:
  - EC2:
    - Classic Load Balancer
    - Auto Scalling Group
  - Route 53
  - RDS
  - CloudWatch
  - VPC
- Terraform
- Jenkins
- Ansible
- Docker


## Associated repositories:
- https://github.com/unicum0212/ansible-roles-petclinic.git - repository with Ansible Roles.
- https://github.com/unicum0212/terraform-modules.git - repository with Terraform modules, i took from there module for security group and module with Load Balancer, Auto Scaling Group, CloudWatch alarms.
- https://github.com/unicum0212/petclinic-java.git - repository with PetClinic Application.

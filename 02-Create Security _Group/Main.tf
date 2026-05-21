/*
1) The name of the security group must be datacenter-sg.
2) The description must be Security group for Nautilus App Servers.
3) Add an inbound rule of type HTTP, with a port range of 80, and source CIDR range 0.0.0.0/0.
4) Add another inbound rule of type SSH, with a port range of 22, and source CIDR range 0.0.0.0/0.
Ensure that the security group is created in the us-east-1 region using Terraform.
*/


resource "aws_security_group" "datacenter-sg" {
  name        = "datacenter-sg"
  description = "Security group for Nautilus App Servers"
}

resource "aws_vpc_security_group_ingress_rule" "allow_HTTP_ipv4" {
  security_group_id = aws_security_group.datacenter-sg.id
  cidr_ipv4         = "0.0.0.0/0"
  from_port         = 80
  ip_protocol       = "tcp"
  to_port           = 80
}

resource "aws_vpc_security_group_ingress_rule" "allow_SSH_ipv4" {
  security_group_id = aws_security_group.datacenter-sg.id
  cidr_ipv4         = "0.0.0.0/0"
  from_port         = 22
  ip_protocol       = "tcp"
  to_port           = 22
}
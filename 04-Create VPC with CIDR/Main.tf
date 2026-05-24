# Create a VPC named nautilus-vpc in us-east-1 region with 192.168.0.0/24 IPv4 CIDR using terraform.

resource "aws_vpc" "nautilus-vpc" {
  cidr_block = "192.168.0.0/24"

   tags = {
     Name = "nautilus-vpc"
  }
}

# Create a VPC named nautilus-vpc in region us-east-1 with any IPv4 CIDR block through terraform.

resource "aws_vpc" "nautilus-vpc" {
  cidr_block = "10.0.0.0/16"

   tags = {
     Name = "nautilus-vpc"
  }
}

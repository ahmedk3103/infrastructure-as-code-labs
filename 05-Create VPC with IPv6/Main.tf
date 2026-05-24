# create a VPC named xfusion-vpc in the us-east-1 region with the Amazon-provided IPv6 CIDR block using terraform.
# AWS does not allow creating a standard VPC with only IPv6 and no IPv4 CIDR.
resource "aws_vpc" "xfusion-vpc" {
  
  cidr_block  = "10.0.0.0/16"
  assign_generated_ipv6_cidr_block = true

   tags = {
     Name = "xfusion-vpc"
  }
}

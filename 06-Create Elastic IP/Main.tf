# For this task, allocate an Elastic IP address named xfusion-eip using Terraform.
# domain - (Optional) Indicates if this EIP is for use in VPC (vpc).
# ipam_pool_id- (Optional) The ID of an IPAM pool which has an Amazon-provided or BYOIP public IPv4 CIDR provisioned to it.
# public_ipv4_pool - (Optional) EC2 IPv4 address pool identifier or amazon. This option is only available for VPC EIPs.

resource "aws_eip" "xfusion-eip" {
  domain = "vpc"

  tags = {
    Name = "xfusion-eip"
  }
}

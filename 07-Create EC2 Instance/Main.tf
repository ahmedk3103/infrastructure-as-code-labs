# The EC2 instance must use the value devops-ec2 as its Name tag, which defines the instance name in AWS.

# Use the Amazon Linux ami-0c101f26f147fa7fd to launch this instance.

# The Instance type must be t2.micro.

# Create a new RSA key named devops-kp.

# Attach the default (available by default) security group.

#ssh-keygen -t rsa > to generate public key on your local pc 
# Generate RSA private/public key
resource "tls_private_key" "devops_key" {
  algorithm = "RSA"
  rsa_bits  = 2048
}

# Create AWS Key Pair
resource "aws_key_pair" "devops-kp" {
  key_name   = "devops-kp"
  public_key = tls_private_key.devops_key.public_key_openssh
}

# Get default VPC
data "aws_vpc" "default" {
  default = true
}

# Get default security group of the default VPC
data "aws_security_group" "default_sg" {
  vpc_id = data.aws_vpc.default.id
  name   = "default"
}

# Create EC2 Instance
resource "aws_instance" "devops-ec2" {
  ami           = "ami-0c101f26f147fa7fd"
  instance_type = "t2.micro"

  key_name = aws_key_pair.devops-kp.key_name

  vpc_security_group_ids = [
    data.aws_security_group.default_sg.id
  ]

  tags = {
    Name = "devops-ec2"
  }
}
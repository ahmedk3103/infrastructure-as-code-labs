resource "tls_private_key" "nautilus_key" {
  algorithm = "RSA"
  rsa_bits  = 2048
}

resource "aws_key_pair" "nautilus_kp" {
  key_name   = "nautilus-kp"
  public_key = tls_private_key.nautilus_key.public_key_openssh
}

resource "local_file" "private_key" {
  content  = tls_private_key.nautilus_key.private_key_pem
  filename = "/home/bob/nautilus-kp.pem"
}
module "ec2-vpc1" {
  source = "./ec2"
  vpc_id = "${module.vpc1.vpc_id}"
  subnet_id = "${module.vpc1.public_subnets[0]}"
  providers = {
    aws = aws.region1
  }
}
module "ec2-vpc2" {
  source = "./ec2"
  vpc_id = "${module.vpc2.vpc_id}"
  subnet_id = "${module.vpc2.public_subnets[0]}"
  providers = {
    aws = aws.region1
  }
}
module "ec2-vpc3" {
  source = "./ec2"
  vpc_id = "${module.vpc3.vpc_id}"
  subnet_id = "${module.vpc3.public_subnets[0]}"
  providers = {
    aws = aws.region1
  }
}
module "ec2-vpc4" {
  source = "./ec2"
  vpc_id = "${module.vpc4.vpc_id}"
  subnet_id = "${module.vpc4.public_subnets[0]}"
  providers = {
    aws = aws.region2
  }
}

resource "tls_private_key" "ssh" {
  algorithm = "RSA"
  rsa_bits  = "2048"
}
resource "local_file" "ssh_pem" {
  filename = "ssh.pem"
  content  = "${tls_private_key.ssh.private_key_pem}"
  file_permission = "0400"
}

resource "aws_key_pair" "ssh-region1" {
  key_name   = "tgw-test-ssh"
  public_key = tls_private_key.ssh.public_key_openssh
  provider = aws.region1
}
resource "aws_key_pair" "ssh-region2" {
  key_name   = "tgw-test-ssh"
  public_key = tls_private_key.ssh.public_key_openssh
  provider = aws.region2
}
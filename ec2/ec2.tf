data "aws_ami" "ubuntu" {
  most_recent = true

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-bionic-18.04-amd64-server-*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  owners = ["099720109477"] # Canonical
}

resource "aws_instance" "instance" {
    ami           = data.aws_ami.ubuntu.id
    instance_type = "t2.micro"
    subnet_id     = var.subnet_id
    vpc_security_group_ids = [aws_security_group.allow-all.id]
    tags = {
        Name = "${var.vpc_id}-instance"
    }
    key_name = "tgw-test-ssh"
}

resource "aws_security_group" "allow-all" {
   name        = "${var.vpc_id}-allow-all"
   description = "Allow all inbound traffic"
   vpc_id      = var.vpc_id

   ingress {
     from_port   = 0
     to_port     = 0
     protocol    = "-1"
     cidr_blocks = ["0.0.0.0/0"]
   }
   egress {
     from_port   = 0
     to_port     = 0
     protocol    = "-1"
     cidr_blocks = ["0.0.0.0/0"]
   }
 }

data "aws_ami" "amazon_linux" {
  most_recent = true

  owners = ["amazon"]

  filter {
    name   = "name"
    values = ["al2023-ami-*-x86_64"]
  }
}

resource "aws_instance" "k8s_master" {
  ami                    = data.aws_ami.amazon_linux.id
  instance_type          = "t2.micro"
  subnet_id              = var.subnet_id
  vpc_security_group_ids = [var.security_group_id]
  key_name               = var.key_name

  associate_public_ip_address = true

  
  root_block_device {
    volume_size = 20      # 20GB (within 30GB free tier)
    volume_type = "gp3"
  }

  tags = {
    Name = "${var.environment}-k8s-master"
  }
}

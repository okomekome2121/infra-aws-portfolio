locals {
  instance_name = "${var.environment}-test"
}

resource "aws_instance" "dev-test" {
  ami                         = var.ami_id
  instance_type               = var.instance_type
  subnet_id                   = var.subnet_id
  key_name                    = var.key_name
  vpc_security_group_ids      = var.security_group_ids
  associate_public_ip_address = var.associate_public_ip_address
  ebs_optimized = true

  ebs_block_device {
    device_name = "/dev/xvdb"
    volume_size = 20
    volume_type = "gp3"
    encrypted   = true
  }

  ebs_block_device {
    device_name = "/dev/xvdc"
    volume_size = 50
    volume_type = "gp3"
    encrypted   = true
  }

  tags = {
    Name = local.instance_name
  }

}

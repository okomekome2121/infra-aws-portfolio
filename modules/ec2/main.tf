locals {
  instance_name = "dev-test-${var.environment}"
}

resource "aws_instance" "dev-test" {
    ami                         = var.ami_id
    instance_type               = var.instance_type
    subnet_id                   = var.subnet_id
  vpc_security_group_ids      = var.security_group_ids
  associate_public_ip_address = var.associate_public_ip_address

  tags = {
    Name = local.instance_name
  }

}

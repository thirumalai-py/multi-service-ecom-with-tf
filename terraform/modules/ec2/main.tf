resource "aws_instance" "ec2_instance" {
  ami = var.ami_id
  instance_type = var.instance_type
  key_name = var.key_name
  subnet_id = var.ec2_subnet_id
  security_groups = var.security_groups

  root_block_device {
    volume_size = var.volume_size
    volume_type = var.volume_type
  }

  tags = {
    Name = var.tag_name
    Environment = var.env_name
  }

}
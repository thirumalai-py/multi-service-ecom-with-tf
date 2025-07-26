module "ec2" {
  source          = "./modules/ec2"
  ami_id          = var.ami_id
  instance_type   = var.instance_type
  key_name        = var.key_name
  ec2_subnet_id   = var.ec2_subnet_id
  volume_size     = var.volume_size
  volume_type     = var.volume_type
  env_name        = var.env_name
  security_groups = var.security_groups
  tag_name        = var.tag_name
}

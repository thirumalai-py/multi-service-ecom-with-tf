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

# Upload and execute deploy script on EC2

resource "null_resource" "post_config" {
  depends_on = [module.ec2]

  connection {
    type = "ssh"
    user = "ubuntu"
    host        = module.ec2.EC2_Public_Ip
    private_key = file("~/.ssh/thirumalai-b10.pem")
  }

  

}

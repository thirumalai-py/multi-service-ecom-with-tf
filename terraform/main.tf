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

# 1. Render your shell script with dynamic values
data "template_file" "docker_script" {
  template = file("${path.module}/scripts/deploy.sh.tpl")
  vars = {
    MONGODB_URI = var.mongodb_uri
    JWT_SECRET  = var.jwt_secret
    EC2_IP      = module.ec2.EC2_Public_Ip
  }
}

# 2. Use remote-exec to run the script on the EC2
resource "null_resource" "run_deployment_script" {
  depends_on = [module.ec2]

  connection {
    type        = "ssh"
    host        = module.ec2.EC2_Public_Ip
    user        = "ubuntu"
    private_key = file(var.private_key_path)
  }

  provisioner "file" {
    content     = data.template_file.docker_script.rendered
    destination = "/home/ubuntu/deploy.sh"
  }

  provisioner "remote-exec" {
    inline = [
      "chmod +x /home/ubuntu/deploy.sh",
      "/home/ubuntu/deploy.sh ${module.ec2.EC2_Public_Ip}"
    ]
  }
}

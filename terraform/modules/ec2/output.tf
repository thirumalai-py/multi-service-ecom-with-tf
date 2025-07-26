output "EC2_Public_Ip" {
  value = aws_instance.ec2_instance.public_ip
}

output "EC2_Private_DNS" {
  value = aws_instance.ec2_instance.private_dns
}

output "EC2_Instance_Id" {
  value = aws_instance.ec2_instance.id
}
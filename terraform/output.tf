output "Output_EC2_Public_Ip" {
  value = module.ec2.EC2_Public_Ip
}

output "Output_EC2_Private_DNS" {
  value = module.ec2.EC2_Private_DNS
}

output "Output_EC2_Instance_Id" {
  value = module.ec2.EC2_Instance_Id
}

output "Output_s3_id" {
  value = module.s3.s3_bucket_id
}
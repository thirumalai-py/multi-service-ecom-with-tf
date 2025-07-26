variable "ami_id" {
  description = "value of ami id"
  type        = string
}

variable "instance_type" {
  description = "value of instance type"
  type        = string
}

variable "ec2_subnet_id" {
  description = "value of subnet id"
  type        = string
}

variable "key_name" {
  description = "value of key name"
  type        = string
}

variable "tag_name" {
  description = "value of tag name"
  type        = string
}

variable "security_groups" {
  description = "value"
  type        = list(string)
}

variable "volume_size" {
  description = "value of volume size in GB"
  type        = number
}

variable "volume_type" {
  description = "value of volume type"
  type        = string
}

variable "env_name" {
  description = "value of env name"
  type        = string
}
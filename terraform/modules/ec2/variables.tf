variable "ami_id" {
    type = "string"
}

variable "instance_type" {
    type = "string"
}

variable "key_name" {
    type = "string"
}

variable "subnet_id" {
    type = "string"
}

variable "security_groups" {
    type = list(string)
}

variable "security_groups" {
    type = list(string)
}

variable "volume_size" {
    type = "number"
}

variable "volume_type" {
  description = "value of volume type"
  type = string
}

variable "env_name" {
    description = "value of env name"
    type = string
}
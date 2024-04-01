variable "secret_key" {
    description = "AWS Secret Key"
    type = string
}

variable "access_key" {
    description = "AWS Access Key"
    type = string
}

variable "ami" {}
variable "key_name" {}
variable "instance_type" {}
variable "bucket_name" {}
variable "security_group" {}
variable "subnet_id" {}
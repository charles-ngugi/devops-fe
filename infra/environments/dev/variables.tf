variable "ami" {}
variable "instance_type" {}
variable "disk_size" {}
variable "instance_name" {}
variable "key_name" {}
variable "my_ip" {} # Your public IP for SSH access
variable "sg_name" {}
variable "allow_http_cidr_blocks" {
  default = ["0.0.0.0/0"] # HTTP access allowed from anywhere by default
}
variable "allow_https_cidr_blocks" {
  default = ["0.0.0.0/0"] # HTTPS access allowed from anywhere by default
}

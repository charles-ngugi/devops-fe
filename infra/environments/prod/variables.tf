variable "sg_name" {}
variable "my_ip" {}

# Other variables
variable "ami" {}
variable "instance_type" {}
variable "disk_size" {}
variable "instance_name" {}
variable "key_name" {}
variable "allow_http_cidr_blocks" {
  default = ["0.0.0.0/0"]
}
variable "allow_https_cidr_blocks" {
  default = ["0.0.0.0/0"]
}

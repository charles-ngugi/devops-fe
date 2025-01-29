variable "ami" {}
variable "instance_type" {}
variable "subnet_id" {}
variable "security_group_id" {}
variable "disk_size" {}
variable "instance_name" {}
variable "key_name" {}
variable "user_data" {
  default = <<-EOF
    #!/bin/bash
    echo "Setting up instance..."
    apt-get update
    apt-get install -y nginx
    apt install git
    systemctl start nginx
    systemctl start mysql
    systemctl enable nginx
    systemctl enable mysql
    EOF
}

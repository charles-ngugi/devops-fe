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
    set -e
    sudo apt update -y
    sudo apt install -y docker.io
    sudo systemctl enable docker
    sudo systemctl start docker
    sudo usermod -aG docker ubuntu  # Add ubuntu user to Docker group
    EOF
}

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

    # Update system packages
    sudo apt update -y

    # Install Docker
    sudo apt install -y docker.io
    sudo systemctl enable docker
    sudo systemctl start docker
    sudo usermod -aG docker ubuntu  

    # Install cadvisor
    docker run -d \
  --name=cadvisor \
  --restart unless-stopped \
  -p 8080:8080 \
  -v /:/rootfs:ro \
  -v /var/run:/var/run:ro \
  -v /sys:/sys:ro \
  -v /var/lib/docker/:/var/lib/docker:ro \
  google/cadvisor:latest

    EOF
}

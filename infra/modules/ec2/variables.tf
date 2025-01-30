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
    sudo docker run \
  --volume=/:/rootfs:ro \
  --volume=/var/run:/var/run:rw \
  --volume=/sys:/sys:ro \
  --volume=/var/lib/docker/:/var/lib/docker:ro \
  --publish=8080:8080 \
  --detach=true \
  --name=cadvisor \
  gcr.io/cadvisor/cadvisor:v0.39.3
  
    EOF
}

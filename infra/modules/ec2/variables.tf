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


    # Install Node Exporter
    NODE_EXPORTER_VERSION="1.7.0"
    sudo useradd --no-create-home --shell /bin/false node_exporter
    cd /tmp
    curl -LO https://github.com/prometheus/node_exporter/releases/download/v${NODE_EXPORTER_VERSION}/node_exporter-${NODE_EXPORTER_VERSION}.linux-amd64.tar.gz
    tar -xvf node_exporter-${NODE_EXPORTER_VERSION}.linux-amd64.tar.gz
    sudo mv node_exporter-${NODE_EXPORTER_VERSION}.linux-amd64/node_exporter /usr/local/bin/
    rm -rf node_exporter-${NODE_EXPORTER_VERSION}.linux-amd64*

    # Create Node Exporter service
    cat <<EOT | sudo tee /etc/systemd/system/node_exporter.service
    [Unit]
    Description=Node Exporter
    After=network.target

    [Service]
    User=node_exporter
    Group=node_exporter
    Type=simple
    ExecStart=/usr/local/bin/node_exporter --web.listen-address=":9100"

    [Install]
    WantedBy=multi-user.target
    EOT

    # Enable and start Node Exporter
    sudo systemctl daemon-reload
    sudo systemctl enable node_exporter
    sudo systemctl start node_exporter

    EOF
}

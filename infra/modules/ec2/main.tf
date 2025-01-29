resource "aws_instance" "devops_fe" {
  ami                         = var.ami
  instance_type               = var.instance_type
  subnet_id                   = var.subnet_id
  key_name                    = var.key_name 
  security_groups             = [var.security_group_id]  
  user_data                   = var.user_data
  associate_public_ip_address = true

  tags = {
    Name = var.instance_name
  }
}

# Allocate an Elastic IP
resource "aws_eip" "devops_fe_eip" {
  domain = "vpc"
}

# Associate Elastic IP with the EC2 instance
resource "aws_eip_association" "eip_assoc" {
  instance_id   = aws_instance.devops_fe.id
  allocation_id = aws_eip.devops_fe_eip.id
}

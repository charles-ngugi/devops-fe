output "instance_id" {
  value = aws_instance.devops_fe.id
}

output "public_ip" {
  description = "The public static IP assigned to the EC2 instance"
  value       = aws_eip.devops_fe_eip.public_ip
}

variable "vpc_id" {}
variable "sg_name" {}
variable "allow_http" {
  description = "CIDR blocks to allow HTTP (port 80) access"
  type        = list(string)
}

variable "allow_https" {
  description = "CIDR blocks to allow HTTPS (port 443) access"
  type        = list(string)
}
variable "my_ip" {}

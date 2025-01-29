module "security" {
  source = "../../modules/security"
  
  vpc_id      = module.vpc.vpc_id 
  sg_name     = var.sg_name
  my_ip       = var.my_ip
  allow_http  = var.allow_http_cidr_blocks
  allow_https = var.allow_https_cidr_blocks
}

module "vpc" {
  source = "../../modules/vpc"

  vpc_cidr            = "10.0.0.0/16" 
  public_subnet_cidr  = "10.0.1.0/24" 
  private_subnet_cidr = "10.0.2.0/24" 
  availability_zone   = "af-south-1a"  
  igw_name            = "prod-igw"   
}

module "ec2" {
  source = "../../modules/ec2"

  ami               = var.ami
  instance_type     = var.instance_type
  key_name          = var.key_name
  instance_name     = var.instance_name
  subnet_id         = module.vpc.public_subnet_id  
  security_group_id = module.security.security_group_id 
  disk_size         = var.disk_size 
}

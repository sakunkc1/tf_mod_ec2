provider aws {
  
  access_key = var.access_key 
  secret_key = var.secret_key 
  region     = var.region
}
resource "aws_eip" "nat" {
  count = 3
  vpc = true
}
module "vpc" {
  source = "terraform-aws-modules/vpc/aws"
name = "subnet_vpc"
  cidr = "10.0.0.0/20"
azs             = ["us-east-1a","us-east-1b","us-east-1c",]
  public_subnets = ["10.0.0.0/23", "10.0.2.0/23", "10.0.4.0/23"]
  private_subnets  = ["10.0.10.0/23", "10.0.12.0/23", "10.0.14.0/23"]
enable_nat_gateway = true
  single_nat_gateway  = false
  reuse_nat_ips       = true  
  external_nat_ip_ids = "${aws_eip.nat.*.id}"
enable_dns_hostnames = true
  enable_dns_support   = true
tags = {
    Terraform = "true"
    Environment = "dev"
  }
}
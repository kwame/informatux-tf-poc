variable "cluster_name" {
  description = "The name to use for all the cluster resources"
  default = "PoC"
}

variable "region" {
  default = "us-east-1" 
}

variable availability_zones {
  type = "list"
  default = ["us-east-1a", "us-east-1b", "us-east-1c","us-east-1d","us-east-1e"]
}

variable vpc_name {
  default = "informatux-poc-vpc"
}

variable cidr {
  default = "10.10.0.0/16"
}

variable env_cidr {
  default = "10.0.0.0/8"
}

variable ssh_key_name {
  default = "informatux-slm"
}

variable public_subnets {
  default = ["10.10.1.0/24", "10.10.2.0/24", "10.10.3.0/24", "10.10.4.0/24", "10.10.5.0/24" ]
}

variable enable_dns_support {
  default = "true"
}

variable map_public_ip_on_launch {
  default = "true"
}

variable enable_dns_hostnames {
  default = "true"
}

variable enable_nat_gateway {
  default = "false"
}

variable "environment" {
  default = "poc" 
}

variable "informatux_poc_instance_size" {
  default = "t2.micro"
}

#Amazon Linux AMI
variable "informatux_ami" {
  default = "ami-a4c7edb2"
}

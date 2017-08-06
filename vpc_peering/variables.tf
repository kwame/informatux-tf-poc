variable ssh_key_name {
  default = "informatux-slm" 
}
    
#Amazon Linux AMI
variable "informatux_ami" {
  default = "ami-a4c7edb2"
}

variable "informatux_poc_instance_size" {
  default = "t2.micro"
}

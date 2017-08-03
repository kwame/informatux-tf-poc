module "vpc" {
  source = "github.com/terraform-community-modules/tf_aws_vpc"

  name = "${var.vpc_name}"

  cidr = "${var.cidr}" 
  public_subnets  = "${var.public_subnets}"

  enable_dns_support = "${var.enable_dns_support}"
  map_public_ip_on_launch = "${var.map_public_ip_on_launch}"
  enable_dns_hostnames = "${var.enable_dns_hostnames}"
  enable_nat_gateway = "${var.enable_nat_gateway}"

  azs      = ["${var.availability_zones}"]
  tags    = { 
        "Terraform" = "true"     
        "Environment" = "${var.environment}" 
  }
}

resource "aws_instance" "informatux_poc" {
  ami = "${var.informatux_ami}"
  instance_type = "${var.informatux_poc_instance_size}"
  key_name = "${var.ssh_key_name}"
  vpc_security_group_ids = ["${aws_security_group.informatux_poc.id}"]
  subnet_id = "${module.vpc.public_subnets[0]}"
  user_data = "${file("tools.sh")}"
  associate_public_ip_address = true
  source_dest_check = false

    tags {
        Name = "Informatux PoC"
    }
}


resource "aws_security_group" "informatux_poc" {
  name   = "${var.cluster_name}-ops-utility-SG"
  vpc_id = "${module.vpc.vpc_id}"
  tags = {
    "Terraform" = "true"
    "Role" = "Informatux PoC security group"
    "Environment" = "${var.cluster_name}"
    "Name" = "${var.cluster_name}-informatux-PoC-SG"
  }
  lifecycle {
    create_before_destroy = true
  }
}

resource "aws_security_group_rule" "allow_server_utility_inbound" {
  type              = "ingress"
  security_group_id = "${aws_security_group.informatux_poc.id}"

  from_port   = 22
  to_port     = 22
  protocol    = "tcp"
  cidr_blocks = ["${var.cidr}"]
}

resource "aws_security_group_rule" "allow_server_utility_outbound" {
  type              = "egress"
  security_group_id = "${aws_security_group.informatux_poc.id}"

  from_port   = 0
  to_port     = 0
  protocol    = "-1"
  cidr_blocks = ["0.0.0.0/0"]
}


output "vpc_id" {
  value = "${module.vpc.vpc_id}"
}

output "public_route_table_ids" {
  value = "${module.vpc.public_route_table_ids}"
}

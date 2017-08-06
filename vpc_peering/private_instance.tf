resource "aws_instance" "ec2" {
  ami = "${var.informatux_ami}"
  subnet_id = "${aws_subnet.main-private-1.id}"
  vpc_security_group_ids = ["${aws_security_group.allow-ssh.id}"]
  key_name = "${var.ssh_key_name}"
  instance_type = "${var.informatux_poc_instance_size}"
}


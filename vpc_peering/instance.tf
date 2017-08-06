resource "aws_instance" "ec2" {
  ami = "${var.informatux_ami}"
  subnet_id = "${aws_subnet.main_public[0].id}"
  vpc_security_group_ids = ["${aws_security_group.allow-ssh.id}"]
  key_name = "${var.informatux-slm}"
}

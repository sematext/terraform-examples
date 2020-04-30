
data "aws_ami" "amazon-linux-2" {
  most_recent = true
  owners      = ["amazon"]
  filter {
    name   = "owner-alias"
    values = ["amazon"]
  }
  filter {
    name   = "name"
    values = ["amzn2-ami-hvm*"]
  }
}

resource "aws_instance" "ec2-instance" {

  ami                         = "${data.aws_ami.amazon-linux-2.id}"
  instance_type               = "t2.micro"
  subnet_id                   = "${aws_subnet.subnet.id}"
  vpc_security_group_ids      = ["${aws_security_group.default.id}"]
  associate_public_ip_address = true
  key_name                    = "deployer-key"


  user_data = <<EOF
        #! /bin/bash
        yum update
        yum install -y gcc-c++ make
        yum clean all
        curl -sL https://deb.nodesource.com/setup_10.x | sudo -E bash -
        yum install -y nodejs
        sudo npm i -g @sematext/logagent
        logagent-setup -i "${var.sematext_logs_token}" -u -u logsene-receiver.sematext.com
    EOF

}

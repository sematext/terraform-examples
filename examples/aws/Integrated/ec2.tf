
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
  vpc_security_group_ids      = [
    "${aws_security_group.default.id}"
  ]
  
  associate_public_ip_address = true
  key_name                    = "deployer-key"
  
  depends_on = [
    sematext_monitor_awsec2.exmaple_monitor,
  ]

  user_data = <<EOF
        #! /bin/bash
        sudo yum update
        wget https://pub-repo.sematext.com/centos/sematext.repo -O /etc/yum.repos.d/sematext.repo
        yum clean all
        yum install spm-client -y
        /opt/spm/bin/setup-infra --infra-token "${resource.monitor_instance.sematext_app_token}"
    EOF

}

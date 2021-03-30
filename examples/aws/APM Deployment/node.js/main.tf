# This example creates an App on Sematext Cloud, creates an EC2 instance and deploys an APM agent.
# Requires SEMATEXT_API_KEY to be set, you can gain this from within your Sematext Cloud account.

# terraform init
# terraform plan
# terraform execute


terraform {
  required_providers {

    aws = {
      source  = "hashicorp/aws"
      version = "~> 2.70"
    }

    sematext = {
      source = "sematext/sematext"
      version = ">= 0.1.8"
    }

  }
}

provider "aws" {
  profile = "default"
  region  = "us-west-2"
}

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

resource "aws_instance" "container" {
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
        sudo npm i -g npm install spm-agent-nodejs
    EOF

}

provider "sematext" {
    sematext_region = "US"
}

resource "sematext_monitor_nodejs" "example" {
    name = "Example Node.js"
    billing_plan_id = 10100
}

resource "null_resource" "deploy_configuration" {
  # Changes to any instance of the cluster requires re-provisioning
  triggers = {
    apptoken_configuration = sematext_monitor_nodejs.example.apptoken
  }

  connection {
    host = "${aws_instance.container.public_ip}"
  }

  provisioner "remote-exec" {    
    inline = [
      "logagent-setup -i "${var.sematext_logs_token}" -u -u logsene-receiver.sematext.com",
    ]
  }
}









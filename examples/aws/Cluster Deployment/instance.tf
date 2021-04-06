
data "aws_ami" "amazon_linux_2" {
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

# TODO setup AWS key for ssh

resource "aws_instance" "ec2" {

  count = length(local.instances)

  tags = {
    Name = local.instances[count.index].name
  }

  user_data                   = local.instances[count.index].install_script
  instance_type               = local.instances[count.index].instance_type
  ami                         = data.aws_ami.amazon_linux_2.id
  associate_public_ip_address = true

}

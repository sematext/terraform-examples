
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

# TODO setup AWS key

resource "aws_instance" "microservice" {

  for_each = toset(local.instances)

  name              = each.value.name
  availability_zone = each.value.availability_zone
  user_data         = each.value.install_script
  instance_type     = each.value.instance_type

  ami                         = data.aws_ami.amazon-linux-2.id
  subnet_id                   = aws_subnet.subnet.id
  vpc_security_group_ids      = aws_security_group.default.id]
  key_name                    = locals.deployer_key
  associate_public_ip_address = true

}

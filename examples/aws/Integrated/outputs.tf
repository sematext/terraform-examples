output "public_ip" {
  description = "The public IP addresses assigned to the ec2 instance."
  value       = aws_instance.ec2-instance.public_ip
}

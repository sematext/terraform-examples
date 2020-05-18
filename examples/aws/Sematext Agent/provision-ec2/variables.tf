variable "aws_region" {
  description = "Region for the VPC"
  default     = "us-east-1"
}

variable "sematext_app_token" {
  type        = string
  description = "Enter your Sematext App Token."
}

variable "key_path" {
  description = "SSH Public Key path"
  default     = "~/.ssh/id_rsa.pub"
}

variable "subnet" {
  default = "10.0.0.0/24"
}

variable "cidr_block" {
  default = "10.0.0.0/16"
}

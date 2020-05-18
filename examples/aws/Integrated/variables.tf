
variable "aws_access_key" {
  description = "Region for the VPC"
  default     = "us-east-1"
}

variable "aws_secret_key" {
  description = "Region for the VPC"
  default     = "us-east-1"
}

variable "aws_region" {
  description = "Region for the VPC"
  default     = "us-east-1"
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

variable "sematext_region" {
  description = "Region for Sematext Monitoring Application US/EU"
  default     = "US"
}

variable "sematext_monitor_name" {
  description = "Descriptive name for the Sematext Cloud monitoring application"
}

variable "sematext_monitor_planid" {
  description = "Select id from https://raw.githubusercontent.com/sematext/terraform-provider-sematext/master/docs/guides/plans.md"
  default     = 65
}

variable "sematext_monitor_fetchfreq" {
  description = "How frequently to fetch metrics. One of MINUTE|FIVE_MINUTES|FIFTEEN_MINUTES"
  default     = "FIFTEEN_MINUTES"
}



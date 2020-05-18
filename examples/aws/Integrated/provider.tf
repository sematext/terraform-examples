provider "aws" {
  region = "${var.aws_region}"
}

provider "sematext" {
  sematext_region = "${var.sematext_region}"
}

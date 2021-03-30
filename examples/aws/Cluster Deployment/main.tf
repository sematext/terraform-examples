# This example creates an App on Sematext Cloud, creates three different
# EC2 cluster groupings and deploys an APM agent to a variable number of instances in each cluster.
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
      source  = "sematext/sematext"
      version = ">= 1.3.0"
    }

  }
}


provider "aws" {
  profile = "default"
  region  = "us-west-1"
}


provider "sematext" {
  sematext_region = "US"
}

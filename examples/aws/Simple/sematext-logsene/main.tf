# This example just creates a visualization and log management app on Sematext Cloud, ready to receive logs.
# Once the app is in place you can configure e.g. rsyslog to send logs to the Sematext endpoint.
#
# Note 1) this example only create the cloud app, it doesn't deploy an APM agent or collector.
# Note 2) this plan will incur charges if you send logs.

# Requires SEMATEXT_API_KEY to be set, you can gain this from within your Sematext Cloud account.

# terraform init
# terraform plan
# terraform execute

terraform {
  required_providers {
    sematext = {
      source = "sematext/sematext"
      version = ">= 0.1.4"
    }
  }
}

provider "sematext" {
    sematext_region = "US" # "US" or "EU"
}

resource "sematext_monitor_logsene" "logship_sink" {
    name = "Example"
    billing_plan_id = 10100 
}

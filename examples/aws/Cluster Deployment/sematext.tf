
# This example demonstrates multiple components logging to the same Sematect Cloud Apps
# Apptokens can either be manually generated and transferred from Sematext Cloud or they can be left blank to be created during creation process.


resource "sematext_monitor_nodejs" "public" {
  apptoken {
    names = locals.apptoken_names
  }
}

resource "sematext_monitor_nodejs" "frontend" {
  apptoken {
    names = locals.apptoken_names
  }
}

resource "sematext_monitor_mongodb" "backend" {
  apptoken {
    names = locals.apptoken_names
  }
}

resource "sematext_monitor_infra" "infra" {
  apptoken {
    names = locals.apptoken_names
  }
}

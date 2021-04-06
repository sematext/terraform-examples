
resource "sematext_monitor_nodejs" "instance" {

  name            = "example"
  billing_plan_id = 109
  apptoken {
    names = local.apptoken_names
  }
}

resource "sematext_monitor_mongodb" "instance" {

  name            = "example"
  billing_plan_id = 125
  apptoken {
    names = local.apptoken_names
  }
}

resource "sematext_monitor_infra" "instance" {

  name            = "example"
  billing_plan_id = 129
  apptoken {
    names = local.apptoken_names
  }
}

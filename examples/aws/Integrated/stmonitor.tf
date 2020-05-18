resource "sematext_monitor_awsec2" "example_monitor" {
  name                        = "${var.sematext_monitor_name}"
  billing_plan_id             = "${var.sematext_monitor_planid}"
  aws_access_key              = "${var.aws_access_key}"
  aws_secret_key              = "${var.aws_secret_key}"
  aws_region                  = "${var.aws_region}"
  aws_fetch_frequency         = "${var.sematext_monitor_fetchfreq}"
}

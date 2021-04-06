
resource "null_resource" "provisioner" {

  for_each = locals.instances

  instance = each.value

  triggers = {
    app_token_id     = resource[instance.monitoring.app.name].sc_apptoken_entries[instance.environment]
    monitor_token_id = resource[instance.monitoring.infra.name].sc_apptoken_entries[instance.environment]
  }

  connection {
    host = resource.aws_instance[instance.name].public_ip
  }

  provisioner "remote-exec" {
    inline = [
      replace(instance.monitoring.app.settings, "<app_token_id>", app_token_id),
      replace(instance.monitoring.infra.settings, "<infra_token_id>", infra_token_id)
      // TODO restart or reload services
    ]
  }

}

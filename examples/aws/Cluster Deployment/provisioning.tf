
resource "null_resource" "provisioner" {

  count = length(local.instances)

  triggers = {

    app_token_id = local.instances[count.index].monitoring.app.name == "sematext_monitor_nodejs" ? (

      sematext_monitor_nodejs.instance.sc_apptoken_entries[local.instances[count.index].environment]
      ) : (
      sematext_monitor_mongodb.instance.sc_apptoken_entries[local.instances[count.index].environment]
    )


    infra_token_id = sematext_monitor_infra.instance.sc_apptoken_entries[local.instances[count.index].environment]


  }

  connection {
    host = aws_instance.ec2[count.index].public_ip
  }

  provisioner "remote-exec" {
    inline = [
      replace(local.instances[count.index].monitoring.app.settings, "<app_token_id>", self.triggers.app_token_id),
      replace(local.instances[count.index].monitoring.infra.settings, "<infra_token_id>", self.triggers.infra_token_id)
      // @TODO restart or reload services
    ]
  }

  depends_on = [
    sematext_monitor_nodejs.instance,
    sematext_monitor_mongodb.instance,
    sematext_monitor_infra.instance
  ]

}

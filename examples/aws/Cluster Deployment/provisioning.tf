
resource "null_resource" "provisioner" {

  for_each = locals.instances

    triggers = {    
        apptoken_id = resource[each.value.collector][each.value.component].sc_apptoken_entries[each.value.environment]
    }

    connection {
        host = resource.aws_instance[each.value.name].public_ip
    }

    provisioner "remote-exec" {
        inline = [        
            replace(each.value.monitor_config , "<target>", apptoken_id)            
        ]
    }

}

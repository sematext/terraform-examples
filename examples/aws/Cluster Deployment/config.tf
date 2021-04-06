
locals {
  monitoring_template = {

    webapp = {
      app = {
        name     = "sematext_monitor_nodejs"
        settings = "MONITORING_TOKEN=<app_token_id> node ./node_modules/spm-agent-nodejs/bin/spmconfig.js"
      }

      infra = {
        name     = "sematext_monitor_infra"
        settings = "/opt/spm/bin/setup-infra --infra-token <infra_token_id>"
      }
    }

    database = {
      app = {
        name     = "sematext_monitor_nodejs"
        settings = "MONITORING_TOKEN=<app_token_id> node ./node_modules/spm-agent-nodejs/bin/spmconfig.js"
      }

      infra = {
        name     = "sematext_monitor_infra"
        settings = "/opt/spm/bin/setup-infra --infra-token <infra_token_id>"
      }
    }

  }

}



locals {

  platform       = "MyExample"
  deployer_key   = "deployer key" # Todo move get this out to env?
  apptoken_names = ["staging", "development", "production"]


  microservices = {

    public = {

      frontend = {

        environments = {
          staging     = 1
          development = 1
          production  = 1
        }

        instance_type  = "t2.micro"
        install_script = file("installs/microservice-public.sh")
        monitoring     = local.monitoring_template.webapp

      }

    }

    user = {

      frontend = {

        environments = {
          staging     = 3
          development = 3
          production  = 3
        }

        instance_type  = "t2.micro"
        install_script = file("installs/microservice-frontend.sh")
        monitoring     = local.monitoring_template.webapp
      }

      backend = {

        environments = {
          staging     = 3
          development = 3
          production  = 3
        }

        instance_type  = "t2.micro"
        install_script = file("installs/microservice-backend.sh")
        monitoring     = local.monitoring_template.database

      }
    }

    account = {

      frontend = {

        environments = {
          staging     = 3
          development = 3
          production  = 3
        }

        instance_type  = "t2.micro"
        install_script = file("installs/microservice-frontend.sh")
        monitoring     = local.monitoring_template.webapp

      }

      backend = {

        environments = {
          staging     = 3
          development = 3
          production  = 3
        }

        instance_type  = "t2.micro"
        install_script = file("installs/microservice-backend.sh")
        monitoring     = local.monitoring_template.database

      }
    }

  }
}

locals {
  instances = flatten(
    [
      for microservice_label, microservice in local.microservices : [
        for component_label, component in microservice : [
          for environment_label, instance_count in component.environments : [
            for i in range(instance_count) : {

              microservice   = microservice_label
              component      = component_label
              environment    = environment_label
              name           = "${local.platform}_${microservice_label}_${component_label}_${environment_label}_${i}"
              instance_type  = local.microservices[microservice_label][component_label].instance_type
              install_script = local.microservices[microservice_label][component_label].install_script
              monitoring     = component.monitoring

            }
          ]
        ]
      ]
    ]
  )
}

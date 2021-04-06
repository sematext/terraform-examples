
locals {

  platform       = "MyExample"
  deployer_key   = "deployer key" # Todo move get this out to env?
  apptoken_names = ["staging", "development", "production"]


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


  microservices = {

    public = {

      frontend = {

        environments = {
          staging     = 1
          development = 1
          production  = 1
        }

        availability_zone = "us-west-1a"
        instance_type     = "t2.micro"
        install_script    = file("installation/microservice-public-frontend-installs.sh")
        monitoring        = locals.monitoring_template.webapp

      }

    }

    user = {

      frontend = {

        environments = {
          staging     = 3
          development = 3
          production  = 3
        }

        availability_zone = "us-west-1a"
        instance_type     = "t2.micro"
        install_script    = file("installation/microservice-user-frontend-installs.sh")
        monitoring        = locals.monitoring_template.webapp
      }

      backend = {

        environments = {
          staging     = 3
          development = 3
          production  = 3
        }

        availability_zone = "us-west-1a"
        instance_type     = "t2.micro"
        install_script    = file("installation/microservice-user-backend-installs.sh")
        monitoring        = locals.monitoring_template.database

      }
    }

    account = {

      frontend = {

        environments = {
          staging     = 3
          development = 3
          production  = 3
        }

        availability_zone = "us-west-1a"
        instance_type     = "t2.micro"
        install_script    = file("installation/microservice-account-frontend-installs.sh")
        monitoring        = locals.monitoring.webapp

      }

      backend = {

        environments = {
          staging     = 3
          development = 3
          production  = 3
        }

        availability_zone = "us-west-1a"
        instance_type     = "t2.micro"
        install_script    = file("installation/microservice-account-backend-installs.sh")
        monitoring        = locals.monitoring.database

      }
    }


    instances = flatten(flatten(flatten(
      [
        for microservice in locals.microservices : [
          for component in microservice : [
            for environment, instance_count in component.environments : [
              for i in range(instance_count) : {

                microservice      = "${microservice}"
                component         = "${component}"
                environment       = "${environment}"
                name              = "${locals.platform}_${microservice}_${component}_${environment}_${i}"
                availability_zone = locals.microservices[microservice][component].availability_zone
                instance_type     = locals.microservices[microservice][component].instance_type
                install_script    = locals.microservices[microservice][component].install_script
                monitoring        = component.monitoring

              }
            ]
          ]
        ]
      ]
    )))

  }
}

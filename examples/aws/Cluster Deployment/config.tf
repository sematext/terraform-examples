# Generate a random vm name
resource "random_string" "instance-name" {
  length  = 6
  upper   = true
  number  = true
  lower   = false
  special = false
}


locals {

  product      = "System123"
  deployer_key = "deployer key" # Todo move get this out to env
  environments = ["staging", "development", "production"]

  microservices = {

    public = {

      frontend = {

        instance_counts = {
          staging     = 1
          development = 1
          production  = 1
        }

        availability_zone = "us-west-1a"
        instance_type     = "t2.micro"
        install_script    = file("installation/microservice-public-frontend-installs.sh")
        monitor         = "sematext_monitor_nodejs"
        monitor_config = "logagent-setup -i \"${???}\" -u -u logsene-receiver.sematext.com"

      }

    }

    user = {

      frontend = {

        instance_counts = {
          staging     = 3
          development = 3
          production  = 3
        }

        availability_zone = "us-west-1a"
        instance_type     = "t2.micro"
        install_script    = file("installation/microservice-user-frontend-installs.sh")
        monitor         = "sematext_monitor_nodejs"
        monitor_config = "logagent-setup -i \"${???}\" -u -u logsene-receiver.sematext.com"
      }

      backend = {

        instance_count = {
          staging     = 3
          development = 3
          production  = 3
        }

        availability_zone = "us-west-1a"
        instance_type     = "t2.micro"
        install_script    = file("installation/microservice-user-backend-installs.sh")
        monitor         = "sematext_monitor_nodejs"
        monitor_config = "logagent-setup -i \"${???}\" -u -u logsene-receiver.sematext.com"
      }
    }

    account = {

      frontend = {

        instance_count = {
          staging     = 3
          development = 3
          production  = 3
        }

        availability_zone = "us-west-1a"
        instance_type     = "t2.micro"
        install_script    = file("installation/microservice-account-frontend-installs.sh")
        monitor         = "sematext_monitor_nodejs"
        monitor_config = "logagent-setup -i \"${???}\" -u -u logsene-receiver.sematext.com"
      }

      backend = {

        instance_count = {
          staging     = 3
          development = 3
          production  = 3
        }

        availability_zone = "us-west-1a"
        instance_type     = "t2.micro"
        install_script    = file("installation/microservice-account-backend-installs.sh")
        monitor         = "sematext_monitor_nodejs"
        monitor_config = "logagent-setup -i \"${???}\" -u -u logsene-receiver.sematext.com"
      }

    }
  }


  instances = flatten(flatten(flatten(
    [
      for microservice in local.microservices : [
        for component in microservice : [
          for environment, instance_count in component.instance_count : [
            for i in range(instance_count) : {
              environment       = "${environment}"
              microservice      = "${microservice}"
              component         = "${component}"
              collector         = "${component.collector}"
              monitor           = "${component.monitor}"
              monitor_config    = "${component.monitor_config}"
              name              = "${local.product}-${microservice}_${component}_${environment}_${random_string.instance-name.result}"
              availability_zone = locals.microservices[microservice][component].availability_zone
              instance_type     = locals.microservices[microservice][component].instance_type
              install_script    = locals.microservices[microservice][component].install_script
            }
          ]
        ]
      ]
    ]
  )))

}

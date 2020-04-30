# Sematext Logagent : Terraform deployment example.

Configuration in this directory deploys a single EC2 instance containing a Sematext Logagent Log Shipper.
Note this is a demonstration. In practice you would transfer the deployment script in the user_data field in ec2.tf to your own Terraform situation rather than build out from this example.

## Usage

Create a Monitoring App of type "Infra" and copy the Monitoring App Token - or execute the commands displayed in the Sematext UI. You will be prompted for this when running the scripts.

To run this example you need to execute:

```bash
$ terraform init
$ terraform plan
$ terraform apply
```

Note that this example may create resources which can cost money. Run `terraform destroy` when you don't need these resources.

<br>
Note: Terraform will automatically search for saved API credentials (for example, in ~/.aws/credentials)
Alternatively set environment variables as:

```bash
$ export AWS_ACCESS_KEY_ID="<Your Access Key>"
$ export AWS_SECRET_ACCESS_KEY="<Your Access Key>"
$ export AWS_DEFAULT_REGION="us-east-1"
```


<br>
For convenience, SSH is installed and your public_key is transferred to the EC2 instance.
'terraform apply' will output the instance's public ip address.

Log in using:

```bash
$ ssh ec-user@<public ip>
```

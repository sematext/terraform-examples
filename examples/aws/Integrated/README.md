# Sematext Agent : Terraform deployment example.

An example deployment of a monitoring application being created on [Sematext Cloud](https://sematext.com/cloud/) and provisioning of a single EC2 instance. 

## Usage

Create 

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

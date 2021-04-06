<h1 align="center">
  <a name="logo" href="https://www.sematext.com"><img src="https://sematext.com/wp-content/uploads/2020/09/just-octi-blue.png" alt="Sematext Home" width="200"></a>
  <br>
  Sematext Cloud - Terraform Examples
</h1>
<h4 align="center">
     Simple Monitoring App Creation
</h4>
<p><font size="3">
This is a simple demonstration for orchestrating a <a href="https://sematext.com/cloud/">Sematext Cloud</a> Monitoring App. 
</p>
<p><font size="3">
In this case this will just cycle App creation and destruction. 
In practice this would appear within your Terraform scripting alongside other Providers. For example you would create a monitoring App on Sematext Cloud then add another cloud container with your code (e.g. AWS-EC2) and configure a suitable Sematext Agent to talk to your monitoring App.
</p>
<p><font size="3">
To run this you need to have the following enviroenment variables set:

```bash
export SEMATEXT_REGION="US"
export SEMATEXT_API_KEY="<your API key see main README>"
```

</p><p><font size="3">

Creation:

```hcl
terraform init
terraform plan
terraform apply
```

Destroy :
```hcl
terraform destroy
```
</p>
<hr>

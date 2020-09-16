<h1 align="center">
  <a name="logo" href="https://www.sematext.com"><img src="./assets/just-octi-blue.png" alt="Sematext Home" width="200"></a>
  <br>
  Sematext Cloud - Terraform Examples
</h1>
<h4 align="center">
    Getting started with Terraform and the <a href="https://registry.terraform.io/providers/sematext/sematext/latest">Sematext Cloud Terraform Provider</a>
</h4>

<div align="center">
  <h4>
    <img src="https://img.shields.io/badge/License-Apache%202.0-blue.svg"/></a>    
    <img src="https://img.shields.io/github/last-commit/sematext/terraform-examples?label=Examples%20Updated"/></a>
    <a href="https://github.com/sematext/terraform-provider-sematext"><img src="https://img.shields.io/github/v/release/sematext/terraform-provider-sematext?label=Latest%20Provider%20Version"/></a>
    <a href="https://github.com/sematext/terraform-examples/commits/master"><img src="https://img.shields.io/github/commit-activity/m/sematext/terraform-provider-sematext?label=Provider%20Commits"></a>
    <a href="https://gitter.im/hashicorp-terraform/Lobby"><img src="https://badges.gitter.im/hashicorp-terraform/Lobby.svg"/></a>
  </h4>
</div>
<p><font size="3">
Examples of using Terraform scripting to automate <a href="https://sematext.com/cloud/">Sematext Cloud</a> monitoring, logging and metric integration alongside your solution.
</p>
<div align="center"><a name="menu"></a>
  <h4>
    <a href="#terraform-resources">Terraform Resources</a>
    <span> | </span>
    <a href="#requirements">Requirements</a>
    <span> | </span>
    <a href="#authentication">Authentication</a>
    <span> | </span>
    <a href="#getting-started">Getting Started</a>
    <span> | </span>
    <a href="./examples">Examples</a>
  </h4>
</div>
<hr>
<h4 align="center">
Sematext are now a Terraform Verified Partner! You can access the Sematext Cloud Provider on the
<a href="https://registry.terraform.io/providers/sematext/sematext/latest">Terraform Registry</a> 
</h4>
<hr>

#### <a name="resources"></a>Sematext Monitoring App Resources supported by this Provider:


<table align="center" border="0" width="100%">
<tbody>
<tr>
<td align="center">

[![Apache Solr](./assets/solr.png)](https://sematext.com/integrations/#solr)

</td>
<td align="center">

[![Solr Cloud](./assets/solrcloud.png)](https://sematext.com/integrations/#solrcloud)
</td>
<td align="center">

[![Elasticsearch](./assets/elasticsearch.png)](https://sematext.com/integrations/#elasticsearch)
</td>
<td align="center">

[![Node.js](./assets/nodejs.png)](https://sematext.com/integrations/#nodejs)
</td>
</tr>
<tr>
<td align="center">

[![Apache Spark](./assets/spark.png)](https://sematext.com/integrations/#spark)
</td>
<td align="center">

[![Apache Kafka](./assets/kafka.png)](https://sematext.com/integrations/#kafka)
</td>
<td align="center">

[![Docker](./assets/docker.png)](https://sematext.com/integrations/#docker)
</td>
<td align="center">

[![Apache Cassandra](./assets/cassandra.png)](https://sematext.com/integrations/#cassandra)
</td>
</tr>
<tr>
<td align="center">

[![Apache HBase](./assets/hbase.png)](https://sematext.com/integrations/#hbase)
</td>
<td align="center">

[![Apache Hadoop](./assets/hadoop.png)](https://sematext.com/integrations/#hadoop)
</td>
<td align="center">

[![MongoDB](./assets/mongodb.png)](https://sematext.com/integrations/#mongodb)
</td>  
<td align="center">

[![Apache Storm](./assets/storm.png)](https://sematext.com/integrations/#storm)
</td>
</tr>
<tr>
<td align="center">

[![AWS EC2](./assets/ec2.png)](https://sematext.com/integrations/#ec2)
</td>
<td align="center">

[![AWS EBS](./assets/ebs.png)](https://sematext.com/integrations/#ebs)
</td>
<td align="center">

[![AWS ELB](./assets/elb.png)](https://sematext.com/integrations/#elb)
</td>
<td align="center">

[![Apache Tomcat](./assets/tomcat.png)](https://sematext.com/integrations/#tomcat)
</td>
</tr>
<tr>
<td align="center">

[![Apache HTTP Server](./assets/apache.png)](https://sematext.com/integrations/#apache)
</td>
<td align="center">

[![Nginx &amp; Nginx Plus](./assets/nginx.png)](https://sematext.com/integrations/#nginx)
</td>
<td align="center">

[![Redis](./assets/redis.png)](https://sematext.com/integrations/#redis)
</td>
<td align="center">

[![MySQL](./assets/mysql.png)](https://sematext.com/integrations/#mysql)
</td>
</tr>
<tr>
<td align="center">

[![Apache Zookeeper](./assets/zookeeper.png)](https://sematext.com/integrations/#zookeeper)
</td>
<td align="center">

[![HAProxy](./assets/haproxy.png)](https://sematext.com/integrations/#haproxy)
</td>
<td align="center">

[![Java](./assets/java.png)](https://sematext.com/integrations/#java)
</td>
<td align="center">

[![Akka](./assets/akka.png)](https://sematext.com/integrations/#akka)
</td>
</tr>
</tbody>
</table>
<hr>
<table border="0">
<tbody>
<tr>
<td>
<img src="./assets/application-performance-monitoring.jpg" /></td>
<td>
<img src="./assets/02-better-visibility.gif" width="">
</td>
</tr>
</table>
<hr>

#### <a name="requirements"></a>Requirements:

* [Terraform](https://www.terraform.io/downloads.html) v0.13+
* [Sematext Cloud Account](https://apps.sematext.com/ui/account/api)
* Sematext Cloud API Access Token
* Your choice of [Sematext Cloud Plan ID](https://github.com/sematext/terraform-provider-sematext/blob/master/docs/guides/plans.md)

<hr>

#### <a name="authentication"></a>Authentication:

These Terraform examples talk to Sematext Cloud and require a Sematext Cloud Access token to function. <br>
You can find this by logging into your [Sematext Cloud Account](https://apps.sematext.com/ui/account/api)

<hr>

#### <a name="gettingstarted"></a>Getting Started:


In your environment you will have the following environment vars:

```sh
SEMATEXT_API_KEY="<your access key>"
SEMATEXT_REGION="<US or EU>"
```

Additionally, if you will be deploying a Sematext Cloud monitoring app that will talk to AWS you will also need:

```sh
AWS_ACCESS_KEY_ID="<aws access key>"
AWS_SECRET_ACCESS_KEY= "<aws secret key>"
AWS_REGION = "<aws region>"
```

In the simplest case a file will contain the following Terraform hcl snippet: 

```hcl
terraform {
  required_providers {
    sematext = {
      source = "sematext/sematext"
      version = "0.1.2"
    }
  }
}

provider "sematext" {
    # provider configuration
}

resource "sematext_monitor_mongodb" "monitor_mongodb" {
    name = "MongoDB Monitor"
    billing_plan_id = 125 
}
```


```bash
$ terraform init
$ terraform plan
$ terraform apply
```

*Note this particular example is an over simplification as a starting point, refer to more realistic examples listed in ./examples directory.*

<hr>


#### <a name="otherresources"></a>Further Information:

* Sematext Manual Intergrations Guide :https://sematext.com/docs/guide/integrations-guide/
* Terraform Website: https://www.terraform.io
* Mailing list: [Google Groups](http://groups.google.com/group/terraform-tool)
* [![Gitter chat](https://badges.gitter.im/hashicorp-terraform/Lobby.svg)](https://gitter.im/hashicorp-terraform/Lobby)


<hr>

<img src="./assets/sematext-featured-image@2x.jpg">


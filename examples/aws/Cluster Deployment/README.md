<h1 align="center">
  <a name="logo" href="https://www.sematext.com"><img src="https://sematext.com/wp-content/uploads/2020/09/just-octi-blue.png" alt="Sematext Home" width="200"></a>
  <br>
  Sematext Cloud - Terraform Examples - Microservice Architecture
</h1>
<h4 align="center">
    Clustered Microservices with Terraform and the <a href="https://registry.terraform.io/providers/sematext/sematext/latest">Sematext Cloud Terraform Provider</a>
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
This example contains Terraform script for automated deployment of a microservice architecture using <a href="https://sematext.com/cloud/">Sematext Cloud</a> for monitoring. <br /><br />

The deployment contains the following hierarchy:

- Public Endpoint:
  - Frontend Component:
    -  Set of EC2 Instances (GraphQL, Express, Node.js).
- Microservice 'User':
  - Frontend Component:
    - Set of EC2 Instances (Node.js, application code)
  - Backend Component
    - Set of EC2 Instances (MongoDB Replica Set).
- Microservice 'Account':
  - Frontend Component:
    - Set of EC2 Instances (Node.js, application code).
  - Backend Component:
    - Set of EC2 Instances (MongoDB Replica Set)

Each component group sends monitoring data to a common Sematext Cloud monitoring app set up specifically for that group.

</p>
<hr>
<p><font size="3">
1 - The demonstration is tiered into the following common environments :

- development;
- staging;
- production.
</p>

<p><font size="3">
2 - Each environment contains the following set of Microservices:

- 'public' - a public GraphQL endpoint - frontend component only (GraphQL, Express, Node.js);
- 'user' - a microservice with frontend (Node.js) and backend components (MongoDB);
- 'account' - a microservice with frontend (Node.js) and backend components (MongoDB);

</p>

<p><font size="3">
3 - Each Component is a cluster containing a variable number of AWS EC2 instances.

The number of instances is a configurable which varies according to the environment.

```bash
terraform init
terraform plan
terraform apply
```

</p>

The following things will occur:

- Sematext Cloud monitoring apps are created for app-level and infra-level monitoring qirth a named apptokens for each environment;
- A Sematext Cloud application token (app-tokens) is created within Sematext Cloud monitoring apps for each environment;
- EC2 instances are created with their initial deployment for code and monitoring agents;
- A Terraform [Null Resource](https://www.terraform.io/docs/language/resources/provisioners/null_resource.html) is created for each EC2 instance.

<br />

[Null Resources](https://www.terraform.io/docs/language/resources/provisioners/null_resource.html) are used as a way to check to see if apptoken ids have changed in Sematext Cloud and trigger a reconfiguration the EC2 instances.
This means the services running on the EC2 instance can just be restarted rather than destroying and redeploying the EC2 instance, losing any persistant data in the process (not a good thing for a database).


This is a conceptual demonstration and some aspects that would be present in practice are omitted for brevity:

- Depending on deployment the public endpoint may be better suited to AWS Lambdas rather than EC2;
- Microservices have event sub-systems (omitted);
- Systemd startup scripts - omitted;
- Networking - deployment is to default subnet, in practice you would define a seperate network spaces for each environment;
- Load Balancing and HA - in practice you would likely put a load balancer in front of the public endpoint;
- Backend clustering of databases is omitted - in practice this would have some role differentiation for different nodes, e.g. master/data or be configured as replica sets as part of initial deployment.

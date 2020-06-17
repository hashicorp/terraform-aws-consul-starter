# Consul AWS Module

This is a Terraform module for provisioning a Consul Cluster on AWS. Consul is a distributed, highly-available service mesh solution providing a full featured control plane with service discovery, configuration, and segmentation functionality. This module will provision a full Consul cluster, which defaults to consisting of 5 (five) servers and 3 (three) clients.

## About This Module

This module implements the [Consul Reference Architecture](https://learn.hashicorp.com/consul/datacenter-deploy/reference-architecture?utm_source=consul.io&utm_medium=docs#datacenter-design) for a single datacenter on AWS.  

## How to Use This Module

- Create a Terraform configuration that pulls in the module and specifies values
  of the required variables:

```hcl
provider "aws" {
  region = "<your AWS region>"
}

provider "random" {
  version = "~> 2.2"
}

module "consul_cluster" {
  source = "git@github.com:hashicorp/terraform-aws-consul-espd.git"

  vpc_id         = "<your VPC id>"
  owner          = "<owner name/tag>"
  name_prefix    = "<name prefix you would like attached to your environment>"
  key_name       = "<your SSH key>"
  consul_servers = 5
  consul_clients = 3
}
```

Note: Currently the random provider is required for this module's functionality.

- If you want to use a certain release of the module, specify the `ref` tag in
  your source option as shown below:

```hcl

provider "aws" {
  region = "<your AWS region>"
}

provider "random" {
  version = "~> 2.2"
}

module "consul_cluster" {
  source = "git@github.com:hashicorp/terraform-aws-consul-espd.git?ref=v0.0.1"

  vpc_id         = "<your VPC id>"
  owner          = "<owner name/tag>"
  name_prefix    = "<name prefix you would like attached to your environment>"
  key_name       = "<your SSH key>"
  consul_servers = 5
  consul_clients = 3
}
```

- Run `terraform init` and `terraform apply`

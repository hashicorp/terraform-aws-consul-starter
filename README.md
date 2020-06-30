# Consul AWS Module

This is a Terraform module for provisioning a Consul Cluster on AWS. Consul is a distributed, highly-available service mesh solution providing a full featured control plane with service discovery, configuration, and segmentation functionality. This module will provision a fully functional Consul cluster, which defaults to consisting of 5 (five) servers and 3 (three) clients.

## About This Module

This module implements the [Consul Reference Architecture](https://learn.hashicorp.com/consul/datacenter-deploy/reference-architecture?utm_source=consul.io&utm_medium=docs#datacenter-design) for a single datacenter on AWS using the Open Source version of Consul. It is created and maintained by HashiCorp to exist as a canonical implementation of a Consul cluster in the Amazon Web Services cloud, and enforces this prescriptive methodology through the use of default values corresponding to the recommendations of our Enterprise Architects.

For more advanced practitioners requiring a wider variety of configurable options out of the box, please see the [Terraform AWS Consul Module](https://registry.terraform.io/modules/hashicorp/consul/aws/0.7.4).

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
  source = "https://github.com/hashicorp/terraform-aws-consul-oss.git"

  vpc_id         = "<your VPC id>"
  owner          = "<owner name/tag>"
  consul_version = "<version of Consul>"
  name_prefix    = "<name prefix you would like attached to your environment>"
  key_name       = "<your SSH key name>"
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
  source = "https://github.com/hashicorp/terraform-aws-consul-oss.git?ref=v0.1.0"

  vpc_id         = "<your VPC id>"
  owner          = "<owner name/tag>"
  consul_version = "<version of Consul>"
  name_prefix    = "<name prefix you would like attached to your environment>"
  key_name       = "<your SSH key name>"
  consul_servers = 5
  consul_clients = 3
}
```

- Run `terraform init` and `terraform apply`

## License

This code is released under the Mozilla Public License 2.0. Please see [LICENSE](https://github.com/hashicorp/terraform-aws-consul-espd/blob/cotarg/add-mpl-20/LICENSE) for more details.

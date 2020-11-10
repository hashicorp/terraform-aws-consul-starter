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

module "consul_cluster" {
  source                = "hashicorp/consul-oss/aws"
  version               = "0.1.0"
  allowed_inbound_cidrs = ["<list of inbound CIDRs>"]
  consul_servers        = 5
  consul_clients        = 3
  consul_version        = "<version of Consul>"
  key_name              = "<your SSH key name>"
  name_prefix           = "<name prefix you would like attached to your environment>"
  vpc_id                = "<your VPC id>"
  owner                 = "<owner name/tag>"

// The following are optional parameters that have defaults provided.
  consul_path           = "/opt/consul"
  syslog                = false
  timed_log_rotation    = false
  sized_log_rotation    = true
  log_rotate_bytes      = "250M"
  log_rotate_duration   = "24H"
  log_rotate_max_files  = "100"
}
```

Notes:

1. Currently the random provider is required for this module's functionality.
2. `allowed_inbound_cidrs` must be supplied for this module's functionality; these CIDRs will be allowed for SSH and UI access.
3. Logging settings are configured in `modules/consul_cluster/scripts`

- Run `terraform init` and `terraform apply`

## License

This code is released under the Mozilla Public License 2.0. Please see [LICENSE](https://github.com/hashicorp/terraform-aws-consul-oss/blob/master/LICENSE) for more details.

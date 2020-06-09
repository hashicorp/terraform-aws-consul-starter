# Vault AWS Module

This is Terraform module for provisioning a Consul Cluster on AWS. (This will
provision five (5) Consul server nodes and three (3) Consul client nodes.)

## How to Use This Module

- Create a Vault AMI [using the provided Packer
  template](modules/consul_cluster/packer)

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

  vpc_id         = "<your VPC id"
  ami_id         = "<the ami you created>"
  owner          = "<owner name/tag>"
  name_prefix    = "<name prefix you would like attached to your environment>"
  key_name       = "<your SSH key>"
  consul_servers = 5
  consul_clients = 3
  ttl            = "-1"
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

  vpc_id         = "<your VPC id"
  ami_id         = "<the ami you created>"
  owner          = "<owner name/tag>"
  name_prefix    = "<name prefix you would like attached to your environment>"
  key_name       = "<your SSH key>"
  consul_servers = 5
  consul_clients = 3
  ttl            = "-1"
}
```

- Run `terraform init` and `terraform apply`

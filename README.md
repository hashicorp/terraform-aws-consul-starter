# Vault AWS Module

This is Terraform module for provisioning a Consul Cluster on AWS. (This will provision five (5) Consul server nodes and three (3) Consul client nodes.)

## How to Use This Module

- Create a Vault AMI [using the provided Packer template](modules/consul_cluster/packer)

- Create a Terraform configuration that pulls in the module and specifies values of the required variables:

```hcl
provider "aws" {
  region = "<your AWS region>"
}

provider "random" {
  version = "~> 2.2"
}

module "consul_cluster" {
  source = "./modules/consul_cluster"

  ami_id                 = var.ami_id
  region                 = var.region
  consul_cluster_version = var.consul_cluster_version
  bootstrap              = var.bootstrap
  key_name               = var.key_name
  name_prefix            = var.name_prefix
  vpc_id                 = var.vpc_id
  subnets                = var.subnets
  availability_zones     = var.availability_zones
  public_ip              = var.public_ip
  consul_servers         = var.consul_servers
  consul_clients         = var.consul_clients
  redundancy_zones       = var.redundancy_zones
  performance_mode       = var.performance_mode
  enable_snapshots       = var.enable_snapshots
  snapshot_interval      = var.snapshot_interval
  snapshot_retention     = var.snapshot_retention
  consul_config          = var.consul_config
  owner                  = var.owner
  ttl                    = var.ttl
}
```

Note: Currently the random provider is required for this module's functionality.

- If you want to use a certain release of the module, specify the `ref` tag in your source option as shown below:

```hcl

provider "aws" {
  region = "<your AWS region>"
}

provider "random" {
  version = "~> 2.2"
}

module "consul_cluster" {
  source = "git@github.com:hashicorp/terraform-aws-consul-espd.git?ref=v0.0.1"

  ami_id                 = var.ami_id
  region                 = var.region
  consul_cluster_version = var.consul_cluster_version
  bootstrap              = var.bootstrap
  key_name               = var.key_name
  name_prefix            = var.name_prefix
  vpc_id                 = var.vpc_id
  subnets                = var.subnets
  availability_zones     = var.availability_zones
  public_ip              = var.public_ip
  consul_servers         = var.consul_servers
  consul_clients         = var.consul_clients
  redundancy_zones       = var.redundancy_zones
  performance_mode       = var.performance_mode
  enable_snapshots       = var.enable_snapshots
  snapshot_interval      = var.snapshot_interval
  snapshot_retention     = var.snapshot_retention
  consul_config          = var.consul_config
  owner                  = var.owner
  ttl                    = var.ttl
}
```

- Run `terraform init` and `terraform apply`

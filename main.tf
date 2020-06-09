module "consul_cluster" {
  source = "./modules/consul_cluster"

#  ami_prefix             = var.ami_prefix
#  ami_release            = var.ami_release
#  ami_os                 = var.ami_os
#  ami_os_release         = var.ami_os_release
#  ami_owner              = var.ami_owner
  ami_id                 = var.ami_id
  instance_type          = var.instance_type
#  region                 = var.region
  consul_cluster_version = var.consul_cluster_version
  bootstrap              = var.bootstrap
  key_name               = var.key_name
  name_prefix            = var.name_prefix
  vpc_id                 = var.vpc_id
#  subnets                = var.subnets
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

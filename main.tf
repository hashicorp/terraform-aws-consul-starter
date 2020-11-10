module "consul_cluster" {
  source = "./modules/consul_cluster"

  allowed_inbound_cidrs  = var.allowed_inbound_cidrs
  instance_type          = var.instance_type
  consul_version         = var.consul_version
  consul_cluster_version = var.consul_cluster_version
  acl_bootstrap_bool     = var.acl_bootstrap_bool
  key_name               = var.key_name
  name_prefix            = var.name_prefix
  vpc_id                 = var.vpc_id
  public_ip              = var.public_ip
  consul_servers         = var.consul_servers
  consul_clients         = var.consul_clients
  consul_config          = var.consul_config
  enable_connect         = var.enable_connect
  owner                  = var.owner
  log_path               = var.log_path
  sized_log_rotation     = var.sized_log_rotation
  timed_log_rotation     = var.timed_log_rotation
}

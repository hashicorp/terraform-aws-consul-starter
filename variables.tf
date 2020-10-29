variable "acl_bootstrap_bool" {
  type        = bool
  default     = true
  description = "Initial ACL Bootstrap configurations"
}

variable "allowed_inbound_cidrs" {
  type        = list(string)
  description = "List of CIDR blocks to permit inbound Consul access from"
}

variable "consul_clients" {
  default     = "3"
  description = "number of Consul instances"
}

variable "consul_config" {
  description = "HCL Object with additional configuration overrides supplied to the consul servers.  This is converted to JSON before rendering via the template."
  default     = {}
}

variable "consul_cluster_version" {
  default     = "0.0.1"
  description = "Custom Version Tag for Upgrade Migrations"
}

variable "consul_servers" {
  default     = "5"
  description = "number of Consul instances"
}

variable "consul_version" {
  description = "Consul version"
}

variable "enable_connect" {
  type        = bool
  description = "Whether Consul Connect should be enabled on the cluster"
  default     = false
}

variable "instance_type" {
  default     = "m5.large"
  description = "Instance type for Consul instances"
}

variable "key_name" {
  default     = "default"
  description = "SSH key name for Consul instances"
}

variable "name_prefix" {
  description = "prefix used in resource names"
}

variable "log_path" {
  type        = string
  default     = "/opt/consul"
  description = "Path for Consul data and logging. No trailing slash."
}

variable "syslog" {
  type        = bool
  default     = false
  description = "Write logging to Syslog rather than log_path"
}

variable "timed_log_rotation" {
  type        = bool
  default     = false
  description = "Creates a new log file every 24hours, for 32 days"
}

variable "sized_log_rotation" {
  type        = bool
  default     = false
  description = "Creates a new log file every 250MB, for 100 logs"
}

variable "owner" {
  description = "value of owner tag on EC2 instances"
}

variable "public_ip" {
  type        = bool
  default     = false
  description = "should ec2 instance have public ip?"
}

variable "vpc_id" {
  description = "VPC ID"
}

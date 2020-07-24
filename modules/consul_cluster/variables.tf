# Required Parameters
variable "allowed_inbound_cidrs" {
  type        = list(string)
  description = "List of CIDR blocks to permit inbound Consul access from"
}

variable "consul_version" {
  type        = string
  description = "Consul version to install"
}

variable "name_prefix" {
  type        = string
  description = "prefix used in resource names"
}

variable "owner" {
  type        = string
  description = "value of owner tag on EC2 instances"
}


variable "vpc_id" {
  type        = string
  description = "VPC ID"
}

# Optional Parameters
variable "acl_bootstrap_bool" {
  type        = bool
  default     = true
  description = "Initial ACL Bootstrap configurations"
}

variable "consul_clients" {
  type        = number
  default     = "3"
  description = "number of Consul instances"
}

variable "consul_config" {
  type        = map(string)
  default     = {}
  description = "HCL Object with additional configuration overrides supplied to the consul servers.  This is converted to JSON before rendering via the template."
}

variable "consul_cluster_version" {
  type        = string
  default     = "0.0.1"
  description = "Custom Version Tag for Upgrade Migrations"
}

variable "consul_servers" {
  type        = number
  default     = "5"
  description = "number of Consul instances"
}

variable "enable_connect" {
  type        = bool
  default     = false
  description = "Whether Consul Connect should be enabled on the cluster"
}

variable "instance_type" {
  type        = string
  default     = "m5.large"
  description = "Instance type for Consul instances"
}

variable "key_name" {
  type        = string
  default     = "default"
  description = "SSH key name for Consul instances"
}

variable "public_ip" {
  type        = bool
  default     = false
  description = "should ec2 instance have public ip?"
}

variable "ami_id" {
  type        = string
  default     = ""
  description = "EC2 instance AMI ID to override the default Ubuntu AMI"
}
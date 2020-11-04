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

variable "ami_id" {
  type        = string
  default     = ""
  description = "EC2 instance AMI ID to override the default Ubuntu AMI"
}

variable "consul_clients" {
  type        = number
  default     = "3"
  description = "number of Consul instances"
}

variable "consul_cluster_version" {
  type        = string
  default     = "0.0.1"
  description = "Custom Version Tag for Upgrade Migrations"
}

variable "consul_config" {
  type        = map(string)
  default     = {}
  description = "HCL Object with additional configuration overrides supplied to the consul servers.  This is converted to JSON before rendering via the template."
}

variable "consul_path" {
  type        = string
  default     = "/opt/consul"
  description = "Path for Consul data and logging. No trailing slash."
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

variable "log_rotate_bytes" {
  type        = string
  default     = "250M"
  description = "250 MB default for sized_log_rotation defaults."
}

variable "log_rotate_duration" {
  type        = string
  default     = "24H"
  description = "24Hour default for timed_log_rotation."
}

variable "log_rotate_max_files" {
  type        = string
  default     = "100"
  description = "100 Log files recommended for time based rotation. 32 recommended for date based rotation."
}

variable "public_ip" {
  type        = bool
  default     = false
  description = "should ec2 instance have public ip?"
}

variable "syslog" {
  type        = bool
  default     = false
  description = "Write logging to Syslog rather than the configured logging path."
}

variable "sized_log_rotation" {
  type        = bool
  default     = true
  description = "Creates a new log file every 250MB, for 100 logs"
}

variable "timed_log_rotation" {
  type        = bool
  default     = false
  description = "Creates a new log file every 24hours, for 32 days."
}

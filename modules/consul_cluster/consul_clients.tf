# creates Consul autoscaling group for clients
resource "aws_autoscaling_group" "consul_clients" {
  name                      = aws_launch_configuration.consul_clients.name
  launch_configuration      = aws_launch_configuration.consul_clients.name
  availability_zones        = data.aws_availability_zones.available.zone_ids
  min_size                  = var.consul_clients
  max_size                  = var.consul_clients
  desired_capacity          = var.consul_clients
  wait_for_capacity_timeout = "480s"
  health_check_grace_period = 15
  health_check_type         = "EC2"
  vpc_zone_identifier       = data.aws_subnet_ids.default.ids

  tags = [
    {
      key                 = "Name"
      value               = "${var.name_prefix}-consul-client"
      propagate_at_launch = true
    },
    {
      key                 = "Cluster-Version"
      value               = var.consul_cluster_version
      propagate_at_launch = true
    },
    {
      key                 = "Environment-Name"
      value               = "${var.name_prefix}-consul"
      propagate_at_launch = true
    },
    {
      key                 = "owner"
      value               = var.owner
      propagate_at_launch = true
    },
    {
      key                 = "ttl"
      value               = var.ttl
      propagate_at_launch = true
    },
  ]

  depends_on = [aws_autoscaling_group.consul_servers]

  lifecycle {
    create_before_destroy = true
  }
}

# provides a resource for a new autoscaling group launch configuration
resource "aws_launch_configuration" "consul_clients" {
  name                        = "${random_id.environment_name.hex}-consul-clients-${var.consul_cluster_version}"
  image_id                    = var.ami_id
  instance_type               = var.instance_type
  key_name                    = var.key_name
  security_groups             = [aws_security_group.consul.id]
  user_data                   = templatefile("${path.module}/scripts/install_hashitools_consul_client.sh.tpl", local.install_consul_tpl)
  associate_public_ip_address = var.public_ip
  iam_instance_profile        = aws_iam_instance_profile.instance_profile.name
  root_block_device {
    volume_size = 10
  }

  lifecycle {
    create_before_destroy = true
  }
}

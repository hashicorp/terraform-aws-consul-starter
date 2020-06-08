#! /usr/bin/env bash

# This script installs base tools needed for functional Ubuntu use in our AMI. This is
# necessary because the base AMI is a minimal install, used to keep our image as lightweight
# as possible.
set -xeuo pipefail

export DEBIAN_FRONTEND=noninteractive

echo "-------------------------------------------"
echo "     Performing System Updates"
echo "-------------------------------------------"
apt update && apt upgrade -y --allow-downgrades  # downgrades may occur if pkgs are pinned
apt update  # for some reason, this is _sometimes_ needed for an ntp dependency? (libopts25)

echo "--------------------------------------"
echo "        Installing packages"
echo "--------------------------------------"
apt install unzip
apt install -y ntp tzdata

echo "Configuring tzdata"
ln -fs /usr/share/zoneinfo/America/New_York /etc/localtime
dpkg-reconfigure --frontend noninteractive tzdata

echo "Configuring ntp"
# Use AWS NTP config for EC2 instances and default for non-AWS
if [ -f /sys/hypervisor/uuid ] && [ $(head -c 3 /sys/hypervisor/uuid) == ec2 ]; then
cat <<EOT > /etc/ntp.conf
driftfile /var/lib/ntp/ntp.drift
disable monitor

restrict default ignore
restrict 127.0.0.1 mask 255.0.0.0
restrict 169.254.169.123 nomodify notrap

server 169.254.169.123 prefer iburst
EOT
else
  echo "USING DEFAULT NTP CONFIGURATION"
fi

service ntp restart

echo 'output: { all: "| tee -a /var/log/cloud-init-output.log" }' | sudo tee -a /etc/cloud/cloud.cfg.d/05_logging.cfg

#####################################################################################################
# TODO: this represents sunk work on an HCL scaffold that should be updated once the JSON is        #
# is working correctly. For now it's commented out in entirety so I don't try to use it.            #
#####################################################################################################


# # The source block would be defined in the builders section in a JSON Packer template.
# # This represents a reusable configuration for starting machines, and images are built
# # from this source. The source has a 1:1 correspondence to a `builder` in a JSON Packer
# # template.

# source "amazon-ebs" "consul-node" {
#   ami_name      = "consul-node-immutable"
#   region        = "us-east-2"
#   instance_type = "m5.large"

#   source_ami_filter {
#     filters {
#       virtualization-type = "hvm"
#       name                = "ubuntu-minimal/images/hvm-ssd/ubuntu-bionic-18.04-amd64-minimal-*"
#       root-device-type    = "ebs"
#     }

#     owners      = ["amazon"]
#     most_recent = "true"
#   }

#   communicator = "ssh"
#   ssh_username = "ubuntu"
# }

# build {
#   sources = [
#     "source.amazon-ebs.consul-node"
#   ]

#   # All provisioners and post-processors have a 1:1 correspondence to their
#   # current layout. The argument name (ie: inline) must to be unquoted
#   # and can be set using the equal sign operator (=).

#   # TODO: Update scripts and installs for Ubuntu, so provisioners can be composed.
#   provisioner "file" {
#     source      = "{{ user `consul.zip`}}"
#     destination = "/tmp/consul.zip"
#   }

#   provisioner "file" {
#     source      = "files"
#     destination = "/tmp"
#   }

#   provisioner "shell" {
#     # execute_command = "sudo {{ .Path }}"
#     script = "scripts/install-base-tools.sh"
#   }

#   provisioner "shell" {
#     # execute_command = "sudo {{ .Path }}"
#     script = "scripts/setup.sh"
#   }

#   provisioner "shell" {
#     # exceute_command = "sudo {{ .Path }}"
#     script = "scripts/cleanup.sh"
#   }
#   # post-processors work too, example: `post-processor "shell-local" {}`.
# }

# // {
# //     "variables": {
# //         "subnet_id": ""
# //     },

# //       "provisioners": [
# //         {
# //             "type": "shell",
# //             "execute_command": "sudo {{ .Path }}",
# //             "script": "../scripts/install-base-tools.sh"
# //         },
# //         {
# //             "type": "shell",
# //             "execute_command": "sudo {{ .Path }}",
# //             "script": "../scripts/install-docker.sh"
# //         },
# //         {
# //             "type": "shell",
# //             "execute_command": "sudo {{ .Vars }} {{ .Path }}",
# //             "environment_vars": [
# //                 "nomad_server=127.0.0.1"
# //             ],
# //             "script": "../scripts/install-nomad.sh"
# //         }
# //     ]
# // }

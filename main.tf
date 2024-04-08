terraform {
  required_version = ">= 1.5.0"

  required_providers {
    linode = {
      source  = "linode/linode"
      version = ">= 2.0"
    }
  }
}

locals {
  node_count = 1
}

resource "linode_instance" "veilid" {
  count = local.node_count
  label = "veilid-node-${count.index}"
  image = "linode/ubuntu22.04"
  # picked the Sweden region because not all Linode regions support the metadata service, which we need
  # for the cloud-init script to work
  region = "se-sto"
  type   = "g6-nanode-1"

  metadata {
    # this is where the authorized ssh key goes
    user_data = base64encode(file("./setup-veilid.yaml"))
  }
}

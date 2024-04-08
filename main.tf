terraform {
  required_version = ">= 1.5.0"

  required_providers {
    digitalocean = {
      source  = "linode/linode"
      version = ">= 2.0"
    }
  }
}

output "public_ip" {
  value = [
    for node in linode_instance.veilid : node.ip_address
  ]
}

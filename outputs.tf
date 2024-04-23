output "public_ipv4" {
  value = [
    for node in linode_instance.veilid : node.ip_address
  ]
}

output "public_ipv6" {
  value = [
    for node in linode_instance.veilid : node.ipv6
  ]
}

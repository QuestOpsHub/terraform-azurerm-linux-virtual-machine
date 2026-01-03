#-----------------------
# Linux Virtual Machine # @todo update outputs
#-----------------------
output "name" {
  value = azurerm_linux_virtual_machine.linux_virtual_machine.name
}

output "id" {
  value = azurerm_linux_virtual_machine.linux_virtual_machine.id
}

#-------------------
# Network Interface
#-------------------
output "applied_dns_servers" {
  value = azurerm_network_interface.network_interface.applied_dns_servers
}

output "network_interface_id" {
  value = azurerm_network_interface.network_interface.id
}

output "internal_domain_name_suffix" {
  value = azurerm_network_interface.network_interface.internal_domain_name_suffix
}

output "mac_address" {
  value = azurerm_network_interface.network_interface.mac_address
}

output "private_ip_address" {
  value = azurerm_network_interface.network_interface.private_ip_address
}

output "private_ip_addresses" {
  value = azurerm_network_interface.network_interface.private_ip_addresses
}
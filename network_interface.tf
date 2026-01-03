#-------------------
# Network Interface
#-------------------
resource "azurerm_network_interface" "network_interface" {
  name                = "nic-${var.name}"
  resource_group_name = var.resource_group_name
  location            = var.location

  dynamic "ip_configuration" {
    for_each = try(var.ip_configuration, {}) != {} ? [var.ip_configuration] : []
    content {
      name                                               = ip_configuration.value.name
      gateway_load_balancer_frontend_ip_configuration_id = lookup(ip_configuration.value, "gateway_load_balancer_frontend_ip_configuration_id", null)
      subnet_id                                          = ip_configuration.value.private_ip_address_version == "IPv4" ? ip_configuration.value.subnet_id : null
      private_ip_address_version                         = lookup(ip_configuration.value, "private_ip_address_version", "IPv4")
      private_ip_address_allocation                      = ip_configuration.value.private_ip_address_allocation
      public_ip_address_id                               = lookup(ip_configuration.value, "public_ip_address_id", null)
      primary                                            = lookup(ip_configuration.value, "primary", false)
      private_ip_address                                 = ip_configuration.value.private_ip_address_allocation == "Static" ? ip_configuration.value.private_ip_address : null
    }
  }

  tags = var.tags
  lifecycle {
    ignore_changes = [
      tags["creation_timestamp"],
      ip_configuration.0.primary
    ]
  }
}
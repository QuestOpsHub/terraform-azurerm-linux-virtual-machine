#---------------
# Managed Disks
#---------------
resource "azurerm_managed_disk" "managed_disk" {
  for_each             = var.managed_disks
  name                 = "${each.key}-${azurerm_linux_virtual_machine.linux_virtual_machine.name}"
  location             = azurerm_linux_virtual_machine.linux_virtual_machine.location
  resource_group_name  = azurerm_linux_virtual_machine.linux_virtual_machine.resource_group_name
  storage_account_type = each.value.storage_account_type
  create_option        = each.value.create_option
  disk_size_gb         = each.value.disk_size_gb
  edge_zone            = lookup(each.value, "edge_zone", "")
  zone                 = lookup(each.value, "zone", null)

  tags = var.tags
  lifecycle {
    ignore_changes = [
      tags["creation_timestamp"],
    ]
  }
}

#--------------------
# VM Disk Attachment
#--------------------
resource "azurerm_virtual_machine_data_disk_attachment" "vm_disk_attachment" {
  for_each           = var.managed_disks
  managed_disk_id    = azurerm_managed_disk.managed_disk[each.key].id
  virtual_machine_id = azurerm_linux_virtual_machine.linux_virtual_machine.id
  lun                = each.value.lun
  caching            = each.value.caching
}
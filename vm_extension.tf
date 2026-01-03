#----------------------------
# Virtual Machine Extensions
#----------------------------
resource "azurerm_virtual_machine_extension" "virtual_machine_extension" {
  for_each                    = var.vm_extensions
  name                        = each.value.name
  virtual_machine_id          = azurerm_linux_virtual_machine.linux_virtual_machine.id
  publisher                   = each.value.publisher
  type                        = each.value.type
  type_handler_version        = each.value.type_handler_version
  auto_upgrade_minor_version  = lookup(each.value, "auto_upgrade_minor_version", null)
  automatic_upgrade_enabled   = lookup(each.value, "automatic_upgrade_enabled", null)
  settings                    = lookup(each.value, "settings", null)
  failure_suppression_enabled = lookup(each.value, "failure_suppression_enabled", false)
  protected_settings          = lookup(each.value, "protected_settings", null)

  dynamic "protected_settings_from_key_vault" {
    for_each = lookup(each.value, "protected_settings_from_key_vault", {}) != {} ? [each.value.protected_settings_from_key_vault] : []
    content {
      secret_url      = protected_settings_from_key_vault.value.secret_url
      source_vault_id = protected_settings_from_key_vault.value.source_vault_id
    }
  }

  provision_after_extensions = lookup(each.value, "provision_after_extensions", null)

  tags = var.tags
  lifecycle {
    ignore_changes = [
      tags["creation_timestamp"],
    ]
  }
}
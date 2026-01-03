#-----------------------
# Linux Virtual Machine
#-----------------------
resource "azurerm_linux_virtual_machine" "linux_virtual_machine" {
  name                  = var.name
  resource_group_name   = var.resource_group_name
  location              = var.location
  admin_username        = var.admin_username
  admin_password        = length(keys(try(var.admin_ssh_key, {}))) == 0 && var.disable_password_authentication == false ? var.admin_password : null
  license_type          = try(var.license_type, null)
  size                  = var.size
  network_interface_ids = [azurerm_network_interface.network_interface.id]

  os_disk {
    caching              = var.os_disk.caching
    storage_account_type = var.os_disk.storage_account_type
    dynamic "diff_disk_settings" {
      for_each = lookup(var.os_disk, "diff_disk_settings", {}) != {} && var.os_disk.caching == "ReadOnly" ? [var.os_disk.diff_disk_settings] : []
      content {
        option    = diff_disk_settings.value.option
        placement = lookup(diff_disk_settings.value, "placement", "CacheDisk")
      }
    }
    disk_encryption_set_id           = lookup(var.os_disk, "disk_encryption_set_id", null)
    disk_size_gb                     = lookup(var.os_disk, "disk_size_gb", null)
    name                             = lookup(var.os_disk, "name", null)
    secure_vm_disk_encryption_set_id = lookup(var.os_disk, "security_encryption_type", null) == "DiskWithVMGuestState" ? lookup(var.os_disk, "secure_vm_disk_encryption_set_id", null) : null
    security_encryption_type         = var.vtpm_enabled == true ? lookup(var.os_disk, "security_encryption_type", null) : null
    write_accelerator_enabled        = var.os_disk.storage_account_type == "Premium_LRS" && var.os_disk.caching == "None" ? lookup(var.os_disk, "write_accelerator_enabled", false) : false
  }

  dynamic "additional_capabilities" {
    for_each = try(var.additional_capabilities, {}) != {} ? [var.additional_capabilities] : []
    content {
      ultra_ssd_enabled   = lookup(additional_capabilities.value, "ultra_ssd_enabled", false)
      hibernation_enabled = lookup(additional_capabilities.value, "hibernation_enabled", null)
    }
  }

  dynamic "admin_ssh_key" {
    for_each = length(keys(try(var.admin_ssh_key, {}))) > 0 && var.admin_password == null ? try(var.admin_ssh_key, {}) : {}
    content {
      public_key = admin_ssh_key.value.public_key
      username   = admin_ssh_key.value.username
    }
  }

  allow_extension_operations = try(var.allow_extension_operations, true)
  availability_set_id        = try(var.availability_set_id, null)

  dynamic "boot_diagnostics" {
    for_each = try(var.boot_diagnostics, {}) != {} ? [var.boot_diagnostics] : []
    content {
      storage_account_uri = lookup(boot_diagnostics.value, "storage_account_uri", null)
    }
  }

  bypass_platform_safety_checks_on_user_schedule_enabled = try(var.bypass_platform_safety_checks_on_user_schedule_enabled, false)
  capacity_reservation_group_id                          = try(var.capacity_reservation_group_id, null)
  computer_name                                          = try(var.computer_name, null)
  custom_data                                            = try(var.custom_data, null)
  dedicated_host_id                                      = try(var.dedicated_host_id, null)
  dedicated_host_group_id                                = try(var.dedicated_host_group_id, null)
  disable_password_authentication                        = try(var.disable_password_authentication, true)
  disk_controller_type                                   = try(var.disk_controller_type, null)
  edge_zone                                              = try(var.edge_zone, null)
  encryption_at_host_enabled                             = try(var.encryption_at_host_enabled, null)
  eviction_policy                                        = var.priority == "Spot" ? try(var.eviction_policy, null) : null
  extensions_time_budget                                 = try(var.extensions_time_budget, "PT1H30M")

  dynamic "gallery_application" {
    for_each = length(keys(try(var.gallery_application, {}))) > 0 ? try(var.gallery_application, {}) : {}
    content {
      version_id                                  = gallery_application.value.version_id
      automatic_upgrade_enabled                   = lookup(gallery_application.value, "automatic_upgrade_enabled", false)
      configuration_blob_uri                      = lookup(gallery_application.value, "configuration_blob_uri", null)
      order                                       = lookup(gallery_application.value, "order", "0")
      tag                                         = lookup(gallery_application.value, "tag", null)
      treat_failure_as_deployment_failure_enabled = lookup(gallery_application.value, "treat_failure_as_deployment_failure_enabled", false)
    }
  }

  dynamic "identity" {
    for_each = try(var.identity.type, null) != null ? [var.identity.type] : []
    content {
      type         = var.identity.type
      identity_ids = var.identity.type == "UserAssigned" || var.identity.type == "SystemAssigned, UserAssigned" ? var.identity.identity_ids : null
    }
  }

  patch_assessment_mode = try(var.patch_assessment_mode, "ImageDefault")
  patch_mode            = try(var.patch_mode, "ImageDefault")
  max_bid_price         = var.priority == "Spot" ? try(var.max_bid_price, null) : null

  dynamic "plan" {
    for_each = try(var.plan, {}) != {} ? [var.plan] : []
    content {
      name      = plan.value.name
      product   = plan.value.product
      publisher = plan.value.publisher
    }
  }

  platform_fault_domain        = try(var.platform_fault_domain, null)
  priority                     = try(var.priority, "Regular")
  provision_vm_agent           = try(var.provision_vm_agent, true)
  proximity_placement_group_id = try(var.proximity_placement_group_id, null)
  reboot_setting               = var.patch_mode == "AutomaticByPlatform" ? var.reboot_setting : null

  dynamic "secret" {
    for_each = length(keys(try(var.secret, {}))) > 0 ? try(var.secret, {}) : {}
    content {
      dynamic "certificate" {
        for_each = length(keys(lookup(secret.value, "certificate", {}))) > 0 ? lookup(secret.value, "certificate", {}) : {}
        content {
          url = certificate.value.url
        }
      }
      key_vault_id = secret.value.key_vault_id
    }
  }

  secure_boot_enabled = try(var.secure_boot_enabled, null)
  source_image_id     = try(var.source_image_reference, {}) == {} ? try(var.source_image_id, null) : null

  dynamic "source_image_reference" {
    for_each = try(var.source_image_reference, {}) != {} && try(var.source_image_id, null) == null ? [var.source_image_reference] : []
    content {
      publisher = source_image_reference.value.publisher
      offer     = source_image_reference.value.offer
      sku       = source_image_reference.value.sku
      version   = source_image_reference.value.version
    }
  }

  dynamic "os_image_notification" {
    for_each = try(var.os_image_notification, {}) != {} ? [var.os_image_notification] : []
    content {
      timeout = lookup(os_image_notification.value, "timeout", "PT15M")
    }
  }

  dynamic "termination_notification" {
    for_each = try(var.termination_notification, {}) != {} ? [var.termination_notification] : []
    content {
      enabled = termination_notification.value.enabled
      timeout = lookup(termination_notification.value, "timeout", "PT5M")
    }
  }

  user_data                         = try(var.user_data, null)
  vm_agent_platform_updates_enabled = try(var.vm_agent_platform_updates_enabled, false)
  vtpm_enabled                      = try(var.vtpm_enabled, null)
  virtual_machine_scale_set_id      = try(var.virtual_machine_scale_set_id, null)
  zone                              = try(var.zone, null)

  tags = var.tags
  lifecycle {
    ignore_changes = [
      tags["creation_timestamp"],
    ]
  }
}
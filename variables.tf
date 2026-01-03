#-----------------------
# Linux Virtual Machine
#-----------------------
variable "name" {
  description = "(Required) The name of the Linux Virtual Machine. Changing this forces a new resource to be created."
  type        = string
}

variable "resource_group_name" {
  description = "(Required) The name of the Resource Group in which the Linux Virtual Machine should be exist. Changing this forces a new resource to be created."
  type        = string
}

variable "location" {
  description = "(Required) The Azure location where the Linux Virtual Machine should exist. Changing this forces a new resource to be created."
  type        = string
}

variable "admin_username" {
  description = "(Required) The username of the local administrator used for the Virtual Machine. Changing this forces a new resource to be created."
  type        = string
}

variable "admin_password" {
  description = "(Optional) The Password which should be used for the local-administrator on this Virtual Machine. Changing this forces a new resource to be created."
  type        = string
  default     = null
}

variable "license_type" {
  description = "(Optional) Specifies the License Type for this Virtual Machine. Possible values are RHEL_BYOS, RHEL_BASE, RHEL_EUS, RHEL_SAPAPPS, RHEL_SAPHA, RHEL_BASESAPAPPS, RHEL_BASESAPHA, SLES_BYOS, SLES_SAP, SLES_HPC."
  type        = string
  default     = null
}

variable "size" {
  description = "(Required) The SKU which should be used for this Virtual Machine, such as Standard_F2."
  type        = string
}

variable "os_disk" {
  description = "(Required) A os_disk block."
  type        = any
}

variable "additional_capabilities" {
  description = "(Optional) A additional_capabilities block."
  type        = any
  default     = {}
}

variable "admin_ssh_key" {
  description = "(Optional) One or more admin_ssh_key blocks. Changing this forces a new resource to be created."
  type        = any
  default     = {}
}

variable "allow_extension_operations" {
  description = "(Optional) Should Extension Operations be allowed on this Virtual Machine? Defaults to true."
  type        = bool
  default     = true
}

variable "availability_set_id" {
  description = "(Optional) Specifies the ID of the Availability Set in which the Virtual Machine should exist. Changing this forces a new resource to be created."
  type        = string
  default     = null
}

variable "boot_diagnostics" {
  description = "(Optional) A boot_diagnostics block."
  type        = any
  default     = {}
}

variable "bypass_platform_safety_checks_on_user_schedule_enabled" {
  description = "(Optional) Specifies whether to skip platform scheduled patching when a user schedule is associated with the VM. Defaults to false."
  type        = bool
  default     = false
}

variable "capacity_reservation_group_id" {
  description = "(Optional) Specifies the ID of the Capacity Reservation Group which the Virtual Machine should be allocated to."
  type        = string
  default     = null
}

variable "computer_name" {
  description = "(Optional) Specifies the Hostname which should be used for this Virtual Machine. If unspecified this defaults to the value for the name field. If the value of the name field is not a valid computer_name, then you must specify computer_name. Changing this forces a new resource to be created."
  type        = string
  default     = null
}

variable "custom_data" {
  description = "(Optional) The Base64-Encoded Custom Data which should be used for this Virtual Machine. Changing this forces a new resource to be created."
  type        = string
  default     = null
}

variable "dedicated_host_id" {
  description = "(Optional) The ID of a Dedicated Host where this machine should be run on. Conflicts with dedicated_host_group_id."
  type        = string
  default     = null
}

variable "dedicated_host_group_id" {
  description = "(Optional) The ID of a Dedicated Host Group that this Linux Virtual Machine should be run within. Conflicts with dedicated_host_id."
  type        = string
  default     = null
}

variable "disable_password_authentication" {
  description = "(Optional) Should Password Authentication be disabled on this Virtual Machine? Defaults to true. Changing this forces a new resource to be created."
  type        = bool
  default     = true
}

variable "disk_controller_type" {
  description = "(Optional) Specifies the Edge Zone within the Azure Region where this Linux Virtual Machine should exist. Changing this forces a new Linux Virtual Machine to be created."
  type        = string
  default     = null
}

variable "edge_zone" {
  description = "(Optional) Specifies the Edge Zone within the Azure Region where this Linux Virtual Machine should exist. Changing this forces a new Linux Virtual Machine to be created."
  type        = string
  default     = null
}

variable "encryption_at_host_enabled" {
  description = "(Optional) Should all of the disks (including the temp disk) attached to this Virtual Machine be encrypted by enabling Encryption at Host?"
  type        = bool
  default     = null
}

variable "eviction_policy" {
  description = "(Optional) Specifies what should happen when the Virtual Machine is evicted for price reasons when using a Spot instance. Possible values are Deallocate and Delete. Changing this forces a new resource to be created."
  type        = string
  default     = null
}

variable "extensions_time_budget" {
  description = "(Optional) Specifies the duration allocated for all extensions to start. The time duration should be between 15 minutes and 120 minutes (inclusive) and should be specified in ISO 8601 format. Defaults to PT1H30M."
  type        = string
  default     = "PT1H30M"
}

variable "gallery_application" {
  description = "(Optional) One or more gallery_application blocks."
  type        = any
  default     = {}
}

variable "identity" {
  description = "(Optional) An identity block"
  type        = any
  default     = {}
}

variable "patch_assessment_mode" {
  description = "(Optional) Specifies the mode of VM Guest Patching for the Virtual Machine. Possible values are AutomaticByPlatform or ImageDefault. Defaults to ImageDefault."
  type        = string
  default     = "ImageDefault"
}

variable "patch_mode" {
  description = "(Optional) Specifies the mode of in-guest patching to this Linux Virtual Machine. Possible values are AutomaticByPlatform and ImageDefault. Defaults to ImageDefault."
  type        = string
  default     = "ImageDefault"
}

variable "max_bid_price" {
  description = "(Optional) The maximum price you're willing to pay for this Virtual Machine, in US Dollars; which must be greater than the current spot price. If this bid price falls below the current spot price the Virtual Machine will be evicted using the eviction_policy. Defaults to -1, which means that the Virtual Machine should not be evicted for price reasons."
  type        = string
  default     = "-1"
}

variable "plan" {
  description = "(Optional) A plan block. Changing this forces a new resource to be created."
  type        = any
  default     = {}
}

variable "platform_fault_domain" {
  description = "(Optional) Specifies the Platform Fault Domain in which this Linux Virtual Machine should be created. Defaults to -1, which means this will be automatically assigned to a fault domain that best maintains balance across the available fault domains. Changing this forces a new Linux Virtual Machine to be created."
  type        = string
  default     = null
}

variable "priority" {
  description = "(Optional) Specifies the priority of this Virtual Machine. Possible values are Regular and Spot. Defaults to Regular. Changing this forces a new resource to be created."
  type        = string
  default     = "Regular"
}

variable "provision_vm_agent" {
  description = "(Optional) Should the Azure VM Agent be provisioned on this Virtual Machine? Defaults to true. Changing this forces a new resource to be created."
  type        = bool
  default     = true
}

variable "proximity_placement_group_id" {
  description = "(Optional) The ID of the Proximity Placement Group which the Virtual Machine should be assigned to."
  type        = string
  default     = null
}

variable "reboot_setting" {
  description = "(Optional) Specifies the reboot setting for platform scheduled patching. Possible values are Always, IfRequired and Never."
  type        = string
  default     = null
}

variable "secret" {
  description = "(Optional) One or more secret blocks."
  type        = any
  default     = {}
}

variable "secure_boot_enabled" {
  description = "(Optional) Specifies whether secure boot should be enabled on the virtual machine. Changing this forces a new resource to be created."
  type        = string
  default     = null
}

variable "source_image_id" {
  description = "(Optional) The ID of the Image which this Virtual Machine should be created from. Changing this forces a new resource to be created. Possible Image ID types include Image IDs, Shared Image IDs, Shared Image Version IDs, Community Gallery Image IDs, Community Gallery Image Version IDs, Shared Gallery Image IDs and Shared Gallery Image Version IDs."
  type        = string
  default     = null
}

variable "source_image_reference" {
  description = "(Optional) A source_image_reference block. Changing this forces a new resource to be created."
  type        = any
  default     = {}
}

variable "os_image_notification" {
  description = "(Optional) A os_image_notification block."
  type        = any
  default     = {}
}

variable "termination_notification" {
  description = "(Optional) A termination_notification block."
  type        = any
  default     = {}
}

variable "user_data" {
  description = "(Optional) The Base64-Encoded User Data which should be used for this Virtual Machine."
  type        = string
  default     = null
}

variable "vm_agent_platform_updates_enabled" {
  description = "(Optional) Specifies whether VMAgent Platform Updates is enabled. Defaults to false."
  type        = bool
  default     = false
}

variable "vtpm_enabled" {
  description = "(Optional) Specifies whether vTPM should be enabled on the virtual machine. Changing this forces a new resource to be created."
  type        = string
  default     = null
}

variable "virtual_machine_scale_set_id" {
  description = "(Optional) Specifies the Orchestrated Virtual Machine Scale Set that this Virtual Machine should be created within."
  type        = string
  default     = null
}

variable "zone" {
  description = "(Optional) Specifies the Availability Zones in which this Linux Virtual Machine should be located. Changing this forces a new Linux Virtual Machine to be created."
  type        = string
  default     = null
}

variable "tags" {
  description = "(Optional) A mapping of tags to assign to the resource."
  type        = map(any)
  default     = {}
}

#-------------------
# Network Interface
#-------------------
variable "ip_configuration" {
  description = "(Required) One or more ip_configuration blocks"
  type        = any
}

#---------------
# Managed Disks
#---------------
variable "managed_disks" {
  description = "(Optional) Managed Disks"
  type        = any
  default     = {}
}

#----------------------------
# Virtual Machine Extensions
#----------------------------
variable "vm_extensions" {
  description = "(Optional) VM Extensions"
  type        = any
  default     = {}
}
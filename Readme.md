## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >=0.13 |
| <a name="requirement_azurerm"></a> [azurerm](#requirement\_azurerm) | >=4.0.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_azurerm"></a> [azurerm](#provider\_azurerm) | >=4.0.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [azurerm_linux_virtual_machine.linux_virtual_machine](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/linux_virtual_machine) | resource |
| [azurerm_managed_disk.managed_disk](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/managed_disk) | resource |
| [azurerm_network_interface.network_interface](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/network_interface) | resource |
| [azurerm_virtual_machine_data_disk_attachment.vm_disk_attachment](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/virtual_machine_data_disk_attachment) | resource |
| [azurerm_virtual_machine_extension.virtual_machine_extension](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/virtual_machine_extension) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_additional_capabilities"></a> [additional\_capabilities](#input\_additional\_capabilities) | (Optional) A additional\_capabilities block. | `any` | `{}` | no |
| <a name="input_admin_password"></a> [admin\_password](#input\_admin\_password) | (Optional) The Password which should be used for the local-administrator on this Virtual Machine. Changing this forces a new resource to be created. | `string` | `null` | no |
| <a name="input_admin_ssh_key"></a> [admin\_ssh\_key](#input\_admin\_ssh\_key) | (Optional) One or more admin\_ssh\_key blocks. Changing this forces a new resource to be created. | `any` | `{}` | no |
| <a name="input_admin_username"></a> [admin\_username](#input\_admin\_username) | (Required) The username of the local administrator used for the Virtual Machine. Changing this forces a new resource to be created. | `string` | n/a | yes |
| <a name="input_allow_extension_operations"></a> [allow\_extension\_operations](#input\_allow\_extension\_operations) | (Optional) Should Extension Operations be allowed on this Virtual Machine? Defaults to true. | `bool` | `true` | no |
| <a name="input_availability_set_id"></a> [availability\_set\_id](#input\_availability\_set\_id) | (Optional) Specifies the ID of the Availability Set in which the Virtual Machine should exist. Changing this forces a new resource to be created. | `string` | `null` | no |
| <a name="input_boot_diagnostics"></a> [boot\_diagnostics](#input\_boot\_diagnostics) | (Optional) A boot\_diagnostics block. | `any` | `{}` | no |
| <a name="input_bypass_platform_safety_checks_on_user_schedule_enabled"></a> [bypass\_platform\_safety\_checks\_on\_user\_schedule\_enabled](#input\_bypass\_platform\_safety\_checks\_on\_user\_schedule\_enabled) | (Optional) Specifies whether to skip platform scheduled patching when a user schedule is associated with the VM. Defaults to false. | `bool` | `false` | no |
| <a name="input_capacity_reservation_group_id"></a> [capacity\_reservation\_group\_id](#input\_capacity\_reservation\_group\_id) | (Optional) Specifies the ID of the Capacity Reservation Group which the Virtual Machine should be allocated to. | `string` | `null` | no |
| <a name="input_computer_name"></a> [computer\_name](#input\_computer\_name) | (Optional) Specifies the Hostname which should be used for this Virtual Machine. If unspecified this defaults to the value for the name field. If the value of the name field is not a valid computer\_name, then you must specify computer\_name. Changing this forces a new resource to be created. | `string` | `null` | no |
| <a name="input_custom_data"></a> [custom\_data](#input\_custom\_data) | (Optional) The Base64-Encoded Custom Data which should be used for this Virtual Machine. Changing this forces a new resource to be created. | `string` | `null` | no |
| <a name="input_dedicated_host_group_id"></a> [dedicated\_host\_group\_id](#input\_dedicated\_host\_group\_id) | (Optional) The ID of a Dedicated Host Group that this Linux Virtual Machine should be run within. Conflicts with dedicated\_host\_id. | `string` | `null` | no |
| <a name="input_dedicated_host_id"></a> [dedicated\_host\_id](#input\_dedicated\_host\_id) | (Optional) The ID of a Dedicated Host where this machine should be run on. Conflicts with dedicated\_host\_group\_id. | `string` | `null` | no |
| <a name="input_disable_password_authentication"></a> [disable\_password\_authentication](#input\_disable\_password\_authentication) | (Optional) Should Password Authentication be disabled on this Virtual Machine? Defaults to true. Changing this forces a new resource to be created. | `bool` | `true` | no |
| <a name="input_disk_controller_type"></a> [disk\_controller\_type](#input\_disk\_controller\_type) | (Optional) Specifies the Edge Zone within the Azure Region where this Linux Virtual Machine should exist. Changing this forces a new Linux Virtual Machine to be created. | `string` | `null` | no |
| <a name="input_edge_zone"></a> [edge\_zone](#input\_edge\_zone) | (Optional) Specifies the Edge Zone within the Azure Region where this Linux Virtual Machine should exist. Changing this forces a new Linux Virtual Machine to be created. | `string` | `null` | no |
| <a name="input_encryption_at_host_enabled"></a> [encryption\_at\_host\_enabled](#input\_encryption\_at\_host\_enabled) | (Optional) Should all of the disks (including the temp disk) attached to this Virtual Machine be encrypted by enabling Encryption at Host? | `bool` | `null` | no |
| <a name="input_eviction_policy"></a> [eviction\_policy](#input\_eviction\_policy) | (Optional) Specifies what should happen when the Virtual Machine is evicted for price reasons when using a Spot instance. Possible values are Deallocate and Delete. Changing this forces a new resource to be created. | `string` | `null` | no |
| <a name="input_extensions_time_budget"></a> [extensions\_time\_budget](#input\_extensions\_time\_budget) | (Optional) Specifies the duration allocated for all extensions to start. The time duration should be between 15 minutes and 120 minutes (inclusive) and should be specified in ISO 8601 format. Defaults to PT1H30M. | `string` | `"PT1H30M"` | no |
| <a name="input_gallery_application"></a> [gallery\_application](#input\_gallery\_application) | (Optional) One or more gallery\_application blocks. | `any` | `{}` | no |
| <a name="input_identity"></a> [identity](#input\_identity) | (Optional) An identity block | `any` | `{}` | no |
| <a name="input_ip_configuration"></a> [ip\_configuration](#input\_ip\_configuration) | (Required) One or more ip\_configuration blocks | `any` | n/a | yes |
| <a name="input_license_type"></a> [license\_type](#input\_license\_type) | (Optional) Specifies the License Type for this Virtual Machine. Possible values are RHEL\_BYOS, RHEL\_BASE, RHEL\_EUS, RHEL\_SAPAPPS, RHEL\_SAPHA, RHEL\_BASESAPAPPS, RHEL\_BASESAPHA, SLES\_BYOS, SLES\_SAP, SLES\_HPC. | `string` | `null` | no |
| <a name="input_location"></a> [location](#input\_location) | (Required) The Azure location where the Linux Virtual Machine should exist. Changing this forces a new resource to be created. | `string` | n/a | yes |
| <a name="input_managed_disks"></a> [managed\_disks](#input\_managed\_disks) | (Optional) Managed Disks | `any` | `{}` | no |
| <a name="input_max_bid_price"></a> [max\_bid\_price](#input\_max\_bid\_price) | (Optional) The maximum price you're willing to pay for this Virtual Machine, in US Dollars; which must be greater than the current spot price. If this bid price falls below the current spot price the Virtual Machine will be evicted using the eviction\_policy. Defaults to -1, which means that the Virtual Machine should not be evicted for price reasons. | `string` | `"-1"` | no |
| <a name="input_name"></a> [name](#input\_name) | (Required) The name of the Linux Virtual Machine. Changing this forces a new resource to be created. | `string` | n/a | yes |
| <a name="input_os_disk"></a> [os\_disk](#input\_os\_disk) | (Required) A os\_disk block. | `any` | n/a | yes |
| <a name="input_os_image_notification"></a> [os\_image\_notification](#input\_os\_image\_notification) | (Optional) A os\_image\_notification block. | `any` | `{}` | no |
| <a name="input_patch_assessment_mode"></a> [patch\_assessment\_mode](#input\_patch\_assessment\_mode) | (Optional) Specifies the mode of VM Guest Patching for the Virtual Machine. Possible values are AutomaticByPlatform or ImageDefault. Defaults to ImageDefault. | `string` | `"ImageDefault"` | no |
| <a name="input_patch_mode"></a> [patch\_mode](#input\_patch\_mode) | (Optional) Specifies the mode of in-guest patching to this Linux Virtual Machine. Possible values are AutomaticByPlatform and ImageDefault. Defaults to ImageDefault. | `string` | `"ImageDefault"` | no |
| <a name="input_plan"></a> [plan](#input\_plan) | (Optional) A plan block. Changing this forces a new resource to be created. | `any` | `{}` | no |
| <a name="input_platform_fault_domain"></a> [platform\_fault\_domain](#input\_platform\_fault\_domain) | (Optional) Specifies the Platform Fault Domain in which this Linux Virtual Machine should be created. Defaults to -1, which means this will be automatically assigned to a fault domain that best maintains balance across the available fault domains. Changing this forces a new Linux Virtual Machine to be created. | `string` | `null` | no |
| <a name="input_priority"></a> [priority](#input\_priority) | (Optional) Specifies the priority of this Virtual Machine. Possible values are Regular and Spot. Defaults to Regular. Changing this forces a new resource to be created. | `string` | `"Regular"` | no |
| <a name="input_provision_vm_agent"></a> [provision\_vm\_agent](#input\_provision\_vm\_agent) | (Optional) Should the Azure VM Agent be provisioned on this Virtual Machine? Defaults to true. Changing this forces a new resource to be created. | `bool` | `true` | no |
| <a name="input_proximity_placement_group_id"></a> [proximity\_placement\_group\_id](#input\_proximity\_placement\_group\_id) | (Optional) The ID of the Proximity Placement Group which the Virtual Machine should be assigned to. | `string` | `null` | no |
| <a name="input_reboot_setting"></a> [reboot\_setting](#input\_reboot\_setting) | (Optional) Specifies the reboot setting for platform scheduled patching. Possible values are Always, IfRequired and Never. | `string` | `null` | no |
| <a name="input_resource_group_name"></a> [resource\_group\_name](#input\_resource\_group\_name) | (Required) The name of the Resource Group in which the Linux Virtual Machine should be exist. Changing this forces a new resource to be created. | `string` | n/a | yes |
| <a name="input_secret"></a> [secret](#input\_secret) | (Optional) One or more secret blocks. | `any` | `{}` | no |
| <a name="input_secure_boot_enabled"></a> [secure\_boot\_enabled](#input\_secure\_boot\_enabled) | (Optional) Specifies whether secure boot should be enabled on the virtual machine. Changing this forces a new resource to be created. | `string` | `null` | no |
| <a name="input_size"></a> [size](#input\_size) | (Required) The SKU which should be used for this Virtual Machine, such as Standard\_F2. | `string` | n/a | yes |
| <a name="input_source_image_id"></a> [source\_image\_id](#input\_source\_image\_id) | (Optional) The ID of the Image which this Virtual Machine should be created from. Changing this forces a new resource to be created. Possible Image ID types include Image IDs, Shared Image IDs, Shared Image Version IDs, Community Gallery Image IDs, Community Gallery Image Version IDs, Shared Gallery Image IDs and Shared Gallery Image Version IDs. | `string` | `null` | no |
| <a name="input_source_image_reference"></a> [source\_image\_reference](#input\_source\_image\_reference) | (Optional) A source\_image\_reference block. Changing this forces a new resource to be created. | `any` | `{}` | no |
| <a name="input_tags"></a> [tags](#input\_tags) | (Optional) A mapping of tags to assign to the resource. | `map(any)` | `{}` | no |
| <a name="input_termination_notification"></a> [termination\_notification](#input\_termination\_notification) | (Optional) A termination\_notification block. | `any` | `{}` | no |
| <a name="input_user_data"></a> [user\_data](#input\_user\_data) | (Optional) The Base64-Encoded User Data which should be used for this Virtual Machine. | `string` | `null` | no |
| <a name="input_virtual_machine_scale_set_id"></a> [virtual\_machine\_scale\_set\_id](#input\_virtual\_machine\_scale\_set\_id) | (Optional) Specifies the Orchestrated Virtual Machine Scale Set that this Virtual Machine should be created within. | `string` | `null` | no |
| <a name="input_vm_agent_platform_updates_enabled"></a> [vm\_agent\_platform\_updates\_enabled](#input\_vm\_agent\_platform\_updates\_enabled) | (Optional) Specifies whether VMAgent Platform Updates is enabled. Defaults to false. | `bool` | `false` | no |
| <a name="input_vm_extensions"></a> [vm\_extensions](#input\_vm\_extensions) | (Optional) VM Extensions | `any` | `{}` | no |
| <a name="input_vtpm_enabled"></a> [vtpm\_enabled](#input\_vtpm\_enabled) | (Optional) Specifies whether vTPM should be enabled on the virtual machine. Changing this forces a new resource to be created. | `string` | `null` | no |
| <a name="input_zone"></a> [zone](#input\_zone) | (Optional) Specifies the Availability Zones in which this Linux Virtual Machine should be located. Changing this forces a new Linux Virtual Machine to be created. | `string` | `null` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_applied_dns_servers"></a> [applied\_dns\_servers](#output\_applied\_dns\_servers) | ------------------- Network Interface ------------------- |
| <a name="output_id"></a> [id](#output\_id) | n/a |
| <a name="output_internal_domain_name_suffix"></a> [internal\_domain\_name\_suffix](#output\_internal\_domain\_name\_suffix) | n/a |
| <a name="output_mac_address"></a> [mac\_address](#output\_mac\_address) | n/a |
| <a name="output_name"></a> [name](#output\_name) | ----------------------- Linux Virtual Machine # @todo update outputs ----------------------- |
| <a name="output_network_interface_id"></a> [network\_interface\_id](#output\_network\_interface\_id) | n/a |
| <a name="output_private_ip_address"></a> [private\_ip\_address](#output\_private\_ip\_address) | n/a |
| <a name="output_private_ip_addresses"></a> [private\_ip\_addresses](#output\_private\_ip\_addresses) | n/a |

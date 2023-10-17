variable "admin_user" {
  description = "User name to use as the admin account on the VMs that will be part of the VM scale set"
  type = string
}

variable "admin_password" {
  description = "Default password for admin account"
  type = string
}

variable "rg_name" {
    description = "The name of the resource group"
    type = string
}

variable "location" {
  description = "Location where resources will be created"
  type = string
}

variable "vmss_name" {
  description = "The name fo the VMSS to be created!"
  type        = string
}

variable "common_tags" {
  description = "The common tags across all resources"
  type        = map(any)
}

variable "disable_password_authentication" {
  description = "The flag variable for disabling password authentication"
  type = bool
}

variable "custom_script" {
  description = "The value of the custom scripts to be run in all the VMs"
  type = string
}

variable "sku_name" {
  description = "The name of the SKU"
  type = string
}

variable "initial_vm_count" {
  description = "The number of VMs to be created while creating VMSS"
  type = number
}

variable "subnet_id" {
  description = "The Subnet ID in which the VMSS has to be created"
  type = string
}

variable "backend_address_pool_ids" {
  description = "The List of backend address pool IDs"
  type = list(string)
}

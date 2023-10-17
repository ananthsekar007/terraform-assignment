variable "subnet_names" {
  description = "The names of the subnets to be created within the vnet"
  type        = map(string)
}

variable "common_tags" {
  description = "The common tags across all resources"
  type        = map(any)
}

variable "vnet_name" {
  description = "The name of the vnet to be created"
  type = string
}

variable "location" {
  description = "The location where the resource is to be created"
  type = string
}

variable "cidr_block" {
  description = "The block in which the vnet shoube be created"
  type = string
}

variable "rg_name" {
  description = "The name of the resource group"
  type = string
}
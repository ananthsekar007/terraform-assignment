variable "server_name" {
  description = "The name of the mysql server"
  type = string
}

variable "admin_user" {
  description = "User name to use as the admin account on the VMs that will be part of the VM scale set"
  type = string
}

variable "admin_password" {
  description = "Default password for admin account"
  type = string
}

variable "location" {
  description = "Location where resources will be created"
  type = string
}

variable "rg_name" {
  description = "Name of the resource group in which the resources will be created"
  type = string
}

variable "zone" {
  description = "The Zone in which the server is to be created"
  type = string
}

variable "private_endpoint_name" {
  description = "The name of the private end point"
  type = string
}

variable "subnet_id" {
  description = "The ID of the subnet in which the server is to be created"
  type = string
}

variable "sku_name" {
  description = "The name of the SKU"
  type = string
}
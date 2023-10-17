variable "resource_group_name" {
  description = "Name of the resource group in which the resources will be created"
  type = string
}

variable "vnet_name" {
  description = "Name of the Vnet which is created!"
  type = string
}

variable "secondary_vnet_name" {  
  description = "Name of the secondary vnet created"
  type = string
}

variable "secondary_subnet_names" {
  description = "The names of the secondary subnets to be created within the secondary vnet"
  type        = map(string)
}

variable "secondary_vnet_address" {
  description = "The value of the secondary cidr block"
  type = string
}

variable "vnet_address" {
  description = "The value of the cidr block"
  type = string
}

variable "subnet_names" {
  description = "The names of the subnets to be created within the vnet"
  type        = map(string)
}

variable "location" {
  description = "Location where resources will be created"
  type = string
}

variable "secondary_location" {
  description = "Secondary Location where resources will be created"
  type = string
}

variable "tags" {
  description = "Map of the tags to use for the resources that are deployed"
  type        = map(string)
  nullable    = true
  default = {
    "environment" = "test"
  }
}

variable "application_port" {
  description = "Port that you want to expose to the external load balancer"
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

variable "vmss_public_ip_name" {
  description = "Name of the public IP to be attached with the VM Scale Set"
  type        = string
}

variable "load_balancer_name" {
  description = "Name of the load balancer to be attached with the VMSS"
  type        = string
}

variable "vmss_name" {
  description = "The name fo the VMSS to be created!"
  type        = string
}

variable "traffic_manager_profile_name" {
  description = "The name of the traffic manager profile which is to be attached with traffic manager endpoint"
  type        = string
}

variable "traffic_manager_endpoint_name" {
  description = "The name of the traffic manager endpoint"
  type        = string
}

variable "mysql_server_name" {
  description = "The name of the MySql Server"
  type        = string
}

variable "secondary_mysql_server_name" {
  description = "The name of the secondary MySql server"
  type = string 
}

variable "mysql_database_name" {
  description = "Tha name of the MySql database"
  type = string
}

variable "mysql_server_private_endpoint_name" {
  description = "The name of the private endpoint"
  type = string
}
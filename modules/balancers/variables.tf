variable "load_balancer_name" {
  description = "Name of the load balancer to be attached with the VMSS"
  type        = string
}

variable "location" {
  description = "Location where resources will be created"
  type = string
}

variable "common_tags" {
  description = "The common tags across all resources"
  type        = map(any)
}

variable "application_port" {
  description = "Port that you want to expose to the external load balancer"
  type = string
}

variable "public_ip_id" {
    description = "The ID of the public ip that is to be linked with load balancer"
    type = string
}

variable "rg_name" {
  description = "The name of the resource group"
  type = string
}
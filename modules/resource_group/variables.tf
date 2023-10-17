variable "rg_name" {
  description = "The name of the resource group"
  type        = list(string)
}

variable "location" {
  description = "The location where the resource group is created"
  type        = string
}

variable "common_tags" {
  description = "The common tags across all resources"
  type        = map(any)
}
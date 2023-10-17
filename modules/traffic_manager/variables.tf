variable "traffic_manager_profile_name" {
  description = "The name of the traffic manager profile"
  type = string
}

variable "application_port" {
  description = "The port in which the traffic manager should be linked"
  type = number
}

variable "common_tags" {
  description = "The common tags across all resources"
  type        = map(any)
}

variable "traffic_manager_endpoint_name" {
  description = "The name of the traffic manager endpoint"
  type        = string
}

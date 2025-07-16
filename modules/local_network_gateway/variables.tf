variable "name" {
  type        = string
  description = "Name of the local network gateway."
}

variable "location" {
  type        = string
  description = "Azure region."
}

variable "resource_group_name" {
  type        = string
  description = "Resource group name."
}

variable "gateway_address" {
  type        = string
  description = "Gateway IP address."
}

variable "address_space" {
  type        = list(string)
  description = "Address space for the local network."
}

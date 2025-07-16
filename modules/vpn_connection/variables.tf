variable "name" {
  type        = string
  description = "Name of the VPN connection."
}

variable "location" {
  type        = string
  description = "Azure region."
}

variable "resource_group_name" {
  type        = string
  description = "Resource group name."
}

variable "virtual_network_gateway_id" {
  type        = string
  description = "ID of the virtual network gateway."
}

variable "local_network_gateway_id" {
  type        = string
  description = "ID of the local network gateway."
}

variable "type" {
  type        = string
  description = "Connection type (IPsec)."
}

variable "connection_protocol" {
  type        = string
  description = "Connection protocol (IKEv2)."
}

variable "shared_key" {
  type        = string
  description = "Shared key for the VPN connection."
}

variable "enable_bgp" {
  type        = bool
  description = "Enable BGP."
}

variable "use_policy_based_traffic_selectors" {
  type        = bool
  description = "Use policy-based traffic selectors."
}

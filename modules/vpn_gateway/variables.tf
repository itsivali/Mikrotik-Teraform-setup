variable "public_ip_name" {
  type        = string
  description = "Name of the public IP."
}

variable "location" {
  type        = string
  description = "Azure region."
}

variable "resource_group_name" {
  type        = string
  description = "Resource group name."
}

variable "allocation_method" {
  type        = string
  description = "Allocation method for the public IP."
}

variable "sku" {
  type        = string
  description = "SKU for the public IP."
}

variable "gateway_name" {
  type        = string
  description = "Name of the virtual network gateway."
}

variable "gateway_type" {
  type        = string
  description = "Type of the gateway (Vpn)."
}

variable "vpn_type" {
  type        = string
  description = "VPN type (RouteBased/PolicyBased)."
}

variable "gateway_sku" {
  type        = string
  description = "SKU for the gateway."
}

variable "ip_config_name" {
  type        = string
  description = "Name of the IP configuration."
}

variable "gateway_subnet_id" {
  type        = string
  description = "ID of the GatewaySubnet."
}

variable "private_ip_allocation" {
  type        = string
  description = "Private IP allocation method."
}

variable "active_active" {
  type        = bool
  description = "Enable active-active mode."
}

variable "enable_bgp" {
  type        = bool
  description = "Enable BGP."
}

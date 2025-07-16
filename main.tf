provider "azurerm" {
  features {}
}

module "resource_group" {
  source   = "./modules/resource_group"
  name     = "rg-vpn"
  location = "South Africa North"
}

module "network" {
  source                = "./modules/network"
  name                  = "vnet-s2s"
  address_space         = ["10.80.0.0/16"]
  location              = module.resource_group.location
  resource_group_name   = module.resource_group.name
  gateway_subnet_prefixes = ["10.80.255.0/27"]
}

module "vpn_gateway" {
  source                = "./modules/vpn_gateway"
  public_ip_name        = "vpn-gateway-pip"
  location              = module.resource_group.location
  resource_group_name   = module.resource_group.name
  allocation_method     = "Dynamic"
  sku                   = "Basic"
  gateway_name          = "vnet-gateway"
  gateway_type          = "Vpn"
  vpn_type              = "RouteBased"
  gateway_sku           = "VpnGw1"
  ip_config_name        = "vnetGatewayConfig"
  gateway_subnet_id     = module.network.gateway_subnet_id
  private_ip_allocation = "Dynamic"
  active_active         = false
  enable_bgp            = false
}

module "local_network_gateway" {
  source                = "./modules/local_network_gateway"
  name                  = "lng-mikrotik"
  location              = module.resource_group.location
  resource_group_name   = module.resource_group.name
  gateway_address       = "41.139.174.85"
  address_space         = ["192.168.100.0/24"]
}

module "vpn_connection" {
  source                              = "./modules/vpn_connection"
  name                                = "vpn-mikrotik-conn"
  location                            = module.resource_group.location
  resource_group_name                 = module.resource_group.name
  virtual_network_gateway_id          = module.vpn_gateway.gateway_id
  local_network_gateway_id            = module.local_network_gateway.id
  type                                = "IPsec"
  connection_protocol                 = "IKEv2"
  shared_key                          = "shi#huA@J74m"
  enable_bgp                          = false
  use_policy_based_traffic_selectors   = false
}
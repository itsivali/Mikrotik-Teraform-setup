resource "azurerm_public_ip" "this" {
  name                = var.public_ip_name
  location            = var.location
  resource_group_name = var.resource_group_name
  allocation_method   = var.allocation_method
  sku                 = var.sku
}

resource "azurerm_virtual_network_gateway" "this" {
  name                = var.gateway_name
  location            = var.location
  resource_group_name = var.resource_group_name
  type                = var.gateway_type
  vpn_type            = var.vpn_type
  sku                 = var.gateway_sku

  ip_configuration {
    name                          = var.ip_config_name
    public_ip_address_id          = azurerm_public_ip.this.id
    subnet_id                     = var.gateway_subnet_id
    private_ip_address_allocation = var.private_ip_allocation
  }

  active_active = var.active_active
  enable_bgp    = var.enable_bgp
}

output "vnet_id" {
  value = azurerm_virtual_network.this.id
}

output "gateway_subnet_id" {
  value = azurerm_subnet.gateway_subnet.id
}

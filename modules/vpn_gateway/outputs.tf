output "gateway_id" {
  value = azurerm_virtual_network_gateway.this.id
}

output "public_ip_id" {
  value = azurerm_public_ip.this.id
}

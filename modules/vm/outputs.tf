output "vm_public_ip_address" {
  value = azurerm_public_ip.public_ip.ip_address
}

output "vm_public_ip_id" {
  value = azurerm_public_ip.public_ip.id
}

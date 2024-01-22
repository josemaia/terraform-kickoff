output "vm_ip" {
  value = azurerm_network_interface.nif.private_ip_address
}

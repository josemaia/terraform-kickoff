resource "azurerm_virtual_machine" "my_vm" {
  name = "ctwsummit-vm"

  location            = data.azurerm_resource_group.tutorial_rg.location
  resource_group_name = data.azurerm_resource_group.tutorial_rg.name

  vm_size = "Standard_B1s"

  network_interface_ids = [resource.azurerm_network_interface.nif.id]

  storage_os_disk {
    name              = "myosdisk1"
    caching           = "ReadWrite"
    create_option     = "FromImage"
    managed_disk_type = "Standard_LRS"
  }
}

resource "azurerm_network_interface" "nif" {
  name = "ctwsummit-nif"
  ip_configuration {
    private_ip_address_allocation = "Dynamic"
    name                          = "ctwsummit-ipconfig"
  }

  location            = data.azurerm_resource_group.tutorial_rg.location
  resource_group_name = data.azurerm_resource_group.tutorial_rg.name
}

resource "azurerm_virtual_network" "vnet" {
  name                = "ctwsummit-vnet"
  address_space       = ["10.0.0.0/16"]
  location            = data.azurerm_resource_group.tutorial_rg.location
  resource_group_name = data.azurerm_resource_group.tutorial_rg.name
}

resource "azurerm_subnet" "subnet" {
  name                 = "ctwsummit-subnet"
  resource_group_name  = data.azurerm_resource_group.tutorial_rg.name
  virtual_network_name = azurerm_virtual_network.vnet.name
  address_prefixes     = ["10.0.1.0/24"]
}

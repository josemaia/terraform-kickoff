#In order to create a VM, first we need a Virtual Network and Subnet. We create the two here.
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

#After that, we need a Network Interface. 
#This is the object that will be attached to the VM to grant it an IP - in this case, via DHCP.
resource "azurerm_network_interface" "nif" {
  name = "ctwsummit-nif"
  ip_configuration {
    private_ip_address_allocation = "Dynamic"
    name                          = "ctwsummit-ipconfig"
    subnet_id                     = azurerm_subnet.subnet.id
  }

  location            = data.azurerm_resource_group.tutorial_rg.location
  resource_group_name = data.azurerm_resource_group.tutorial_rg.name
}

#Now we are ready to create the VM itself. Note that the order does not matter whatsoever, Terraform will
#figure out in which order to apply things.
#This VM will not be used for anything, so we don't need to worry about opening ports or otherwise making sure
#we can log into it.
resource "azurerm_linux_virtual_machine" "my_vm" {
  name = "ctwsummit-vm-${var.project_name}"

  location            = data.azurerm_resource_group.tutorial_rg.location
  resource_group_name = data.azurerm_resource_group.tutorial_rg.name

  size = "Standard_B1s"

  network_interface_ids           = [resource.azurerm_network_interface.nif.id]
  admin_username                  = "ctwsummit"
  admin_password                  = "ThisIsNotARealPW!" #NEVER USE THIS IN A REAL SCENARIO!
  disable_password_authentication = false               #NEVER USE THIS IN A REAL SCENARIO!

  source_image_reference {
    publisher = "Canonical"
    offer     = "0001-com-ubuntu-server-jammy"
    sku       = "22_04-lts-gen2"
    version   = "latest"
  }

  os_disk {
    name                 = "ctwsummit-vm-osdisk1"
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }
}


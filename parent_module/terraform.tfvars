rg = {
  "rg1" = {
    name     = "rg-dev-eastus"
    location = "East US"
    tags = {
      environment = "dev"
      project     = "myapp"
    }
  }
}

vnet = {
  "vnet1" = {
    name                = "vnet-dev-eastus"
    resource_group_name = "rg-dev-eastus"
    location            = "East US"
    address_space       = ["10.0.0.0/16"]
    tags = {
      environment = "dev"
      project     = "myapp"
    }
  }
}

subnet = {
  "subnet1" = {
    name                 = "subnet-dev-web"
    resource_group_name  = "rg-dev-eastus"
    virtual_network_name = "vnet-dev-eastus"
    address_prefixes     = ["10.0.1.0/24"]
  }
}

pip = {
  "pip1" = {
    name                = "pip-dev-vm1"
    resource_group_name = "rg-dev-eastus"
    location            = "East US"
    allocation_method   = "Static"
    sku                 = "Standard"
    tags = {
      environment = "dev"
      project     = "myapp"
    }
  }
  "pip2" = {
    name                = "pip-bastion-dev"
    resource_group_name = "rg-dev-eastus"
    location            = "East US"
    allocation_method   = "Static"
    sku                 = "Standard"
    tags = {
      environment = "dev"
      project     = "myapp"
    }
  }
}

nic = {
  "nic1" = {
    name                          = "nic-dev-vm1"
    resource_group_name           = "rg-dev-eastus"
    location                      = "East US"
    ip_config_name                = "ipconfig-dev-vm1"
    subnet_name                   = "subnet-dev-web"
    virtual_network_name          = "vnet-dev-eastus"
    pip_name                      = "pip-dev-vm1"
    private_ip_address_allocation = "Dynamic"
    tags = {
      environment = "dev"
      project     = "myapp"
    }
  }
}

vm = {
  "vm1" = {
    name                = "vm-dev-01"
    resource_group_name = "rg-dev-eastus"
    location            = "East US"
    size                = "Standard_B2s"
    admin_username      = "azureadmin"
    admin_password      = "P@ssw0rd1234!"
    nic_name            = "nic-dev-vm1"
    tags = {
      environment = "dev"
      project     = "myapp"
      role        = "webserver"
    }
    os_disk = {
      caching              = "ReadWrite"
      storage_account_type = "Standard_LRS"
    }
    source_image_reference = {
      publisher = "Canonical"
      offer     = "UbuntuServer"
      sku       = "18.04-LTS"
      version   = "latest"
    }
  }
}

bastion = {
  "bastion1" = {
    name                 = "bastion-dev"
    resource_group_name  = "rg-dev-eastus"
    location             = "East US"
    subnet_name          = "AzureBastionSubnet"
    virtual_network_name = "vnet-dev-eastus"
    pip_name             = "pip-bastion-dev"
    tags = {
      environment = "dev"
      project     = "myapp"
    }
  }
}

nsg = {
  "nsg1" = {
    name                 = "nsg-dev-web"
    resource_group_name  = "rg-dev-eastus"
    location             = "East US"
    subnet_name          = "subnet-dev-web"
    virtual_network_name = "vnet-dev-eastus"
    tags = {
      environment = "dev"
      project     = "myapp"
    }
    security_rules = {
      "allow-ssh" = {
        priority                   = 100
        direction                  = "Inbound"
        access                     = "Allow"
        protocol                   = "Tcp"
        source_port_range          = "*"
        destination_port_range     = "22"
        source_address_prefix      = "*"
        destination_address_prefix = "*"
      }
      "allow-http" = {
        priority                   = 110
        direction                  = "Inbound"
        access                     = "Allow"
        protocol                   = "Tcp"
        source_port_range          = "*"
        destination_port_range     = "80"
        source_address_prefix      = "*"
        destination_address_prefix = "*"
      }
    }
  }
}

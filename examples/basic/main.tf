data "azurerm_client_config" "current" {}

resource "azurerm_resource_group" "example" {
  name     = "rg-keyvault-example"
  location = "eastus"
}

module "vault" {
  source = "../.."

  name                = "kv-example-${random_string.suffix.result}"
  resource_group_name = azurerm_resource_group.example.name
  location            = azurerm_resource_group.example.location
  tenant_id           = data.azurerm_client_config.current.tenant_id

  tags = {
    Environment = "example"
  }
}

resource "random_string" "suffix" {
  length  = 6
  special = false
  upper   = false
}

output "vault_uri" {
  value = module.vault.uri
}

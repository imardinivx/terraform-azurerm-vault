# terraform-azurerm-vault

Terraform module for creating an Azure Key Vault.

## Usage

```hcl
module "vault" {
  source = "github.com/your-org/terraform-azurerm-vault?ref=v1.0.0"

  name                = "my-keyvault"
  resource_group_name = "my-rg"
  location            = "eastus"
  tenant_id           = "00000000-0000-0000-0000-000000000000"

  tags = {
    Environment = "dev"
  }
}
```

<!-- BEGIN_TF_DOCS -->
<!-- END_TF_DOCS -->

variable "name" {
  description = "Name of the Key Vault"
  type        = string
}

variable "resource_group_name" {
  description = "Name of the resource group"
  type        = string
}

variable "location" {
  description = "Azure region for the Key Vault"
  type        = string
}

variable "tenant_id" {
  description = "Azure AD tenant ID for the Key Vault"
  type        = string
}

variable "sku_name" {
  description = "SKU name for the Key Vault (standard or premium)"
  type        = string
  default     = "standard"
}

variable "enabled_for_disk_encryption" {
  description = "Whether Azure Disk Encryption is permitted to retrieve secrets"
  type        = bool
  default     = false
}

variable "enabled_for_deployment" {
  description = "Whether Azure VMs are permitted to retrieve certificates"
  type        = bool
  default     = false
}

variable "enabled_for_template_deployment" {
  description = "Whether Azure Resource Manager is permitted to retrieve secrets"
  type        = bool
  default     = false
}

variable "enable_rbac_authorization" {
  description = "Whether RBAC authorization is enabled instead of access policies"
  type        = bool
  default     = true
}

variable "purge_protection_enabled" {
  description = "Whether purge protection is enabled"
  type        = bool
  default     = false
}

variable "soft_delete_retention_days" {
  description = "Number of days to retain soft-deleted keys"
  type        = number
  default     = 7
}

variable "network_acls" {
  description = "Network ACL configuration"
  type = object({
    bypass                     = optional(string, "None")
    default_action             = optional(string, "Deny")
    ip_rules                   = optional(list(string), [])
    virtual_network_subnet_ids = optional(list(string), [])
  })
  default = null
}

variable "tags" {
  description = "Tags to apply to the Key Vault"
  type        = map(string)
  default     = {}
}

resource "azurerm_storage_account" "bad_sa" {
  name                     = "trivydemostorage245e"
  resource_group_name      = azurerm_resource_group.rg.name
  location                 = azurerm_resource_group.rg.location
  account_tier             = "Standard"
  account_replication_type = "LRS"

  # ❌ insecure settings
  min_tls_version            = "TLS1_0" # TFSEC: AZU020
  https_traffic_only_enabled = false    # TFSEC: AZU024
}

resource "azurerm_network_security_group" "open_nsg" {
  name                = "allow-all"
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
}

resource "azurerm_network_security_rule" "open_ingress" {
  name                        = "allow-all"
  resource_group_name         = azurerm_resource_group.rg.name
  network_security_group_name = azurerm_network_security_group.open_nsg.name

  priority                   = 100
  direction                  = "Inbound"
  access                     = "Allow"
  protocol                   = "*"
  source_port_range          = "*"
  destination_port_range     = "*"
  source_address_prefix      = "0.0.0.0/0" # TFSEC: AZU002
  destination_address_prefix = "*"
}

resource "azurerm_key_vault" "bad_kv" {
  name                = "trivy-demo-kv"
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
  tenant_id           = "104e77d4-81e7-4c16-ab44-935220bed6dd"
  sku_name            = "standard"

  # ❌ must be true in prod
  purge_protection_enabled   = false # TFSEC: AZU041
  soft_delete_retention_days = null  # TFSEC: AZU040
}
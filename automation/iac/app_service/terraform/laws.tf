module "log_analytics_workspace" {
  source = "Azure/avm-res-operationalinsights-workspace/azurerm"

  # Required variables
  name                = module.naming.log_analytics_workspace.name
  resource_group_name = azurerm_resource_group.rg.name
  location            = var.region

  # Optional variables
  log_analytics_workspace_retention_in_days = 30
  log_analytics_workspace_daily_quota_gb    = 1
  log_analytics_workspace_sku               = "PerGB2018"
  enable_telemetry                          = var.enable_telemetry
}

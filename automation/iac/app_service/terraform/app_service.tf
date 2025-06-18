# AVM Module for Azure App Service Plan (asp) provisioning
module "asp" {
  source = "Azure/avm-res-web-serverfarm/azurerm"

  # Required variables
  name                = module.naming.app_service_plan.name
  resource_group_name = azurerm_resource_group.rg.name
  location            = var.region
  os_type             = "Linux"

  # Optional variables
  sku_name               = "B1"
  zone_balancing_enabled = false
  enable_telemetry       = var.enable_telemetry
}

module "avm_res_web_site" {
  source = "Azure/avm-res-web-site/azurerm"

  # Required variables
  name                     = module.naming.app_service.name
  resource_group_name      = azurerm_resource_group.rg.name
  location                 = var.region
  kind                     = "webapp"
  service_plan_resource_id = module.asp.resource_id
  os_type                  = module.asp.resource.os_type

  # Optional variables
  enable_telemetry = var.enable_telemetry

  application_insights = {
    workspace_resource_id = module.log_analytics_workspace.resource_id
  }

  site_config = {
    always_on = false
  }
}

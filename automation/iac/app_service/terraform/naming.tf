module "naming" {
  source = "Azure/naming/azurerm"

  suffix = [var.org, var.app, var.stage, var.region]
}
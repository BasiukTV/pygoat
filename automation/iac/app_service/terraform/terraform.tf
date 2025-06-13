terraform {
  required_version = ">= 1.11"
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 4.0"
    }
  }

  # This block is used to configure Terraform Cloud
  cloud {
    organization = "taras-clp"
    workspaces {
      # Compy and modify the following line to use a specific workspace for your user
      # name = "dev-<user>"
      name = "dev-taras"
    }
  }
}

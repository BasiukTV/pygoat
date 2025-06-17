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

    # Workspaces selection is done via TF_WORKSPACE variable
    # Set it to dev-<user> for local development
    # workspaces {
    #   name = "dev-<user>"
    # }
  }
}

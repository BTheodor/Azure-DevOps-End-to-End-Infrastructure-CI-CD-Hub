terraform {
  backend "azurerm" {
    # These values should be provided via init arguments or pipeline variables
    # resource_group_name  = "rg-terraform-state"
    # storage_account_name = "sttfstate12345"
    # container_name       = "tfstate"
    # key                  = "prod.terraform.tfstate"
  }
}
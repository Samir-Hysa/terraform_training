resource "azurerm_resource_group" "main-rg" {
  name     = var.main-rg["name"]
  location = var.main-rg["location"]
}

resource "azurerm_service_plan" "plan" {
  name                = "tailspin-space-game-zz1zz"
  location            = var.main-rg["location"]
  resource_group_name = var.main-rg["name"]
  os_type             = "Linux"
  sku_name            = "S1"
  depends_on = [
    azurerm_resource_group.main-rg
  ]
}

resource "azurerm_linux_web_app" "web_app" {
  name                = "tailspin-space-game-web-zz1zz"
  location            = var.main-rg["location"]
  resource_group_name = var.main-rg["name"]
  service_plan_id     = azurerm_service_plan.plan.id

  site_config {
    application_stack {
      dotnet_version = "6.0"
    }
  }
  depends_on = [
    azurerm_resource_group.main-rg
  ]
}

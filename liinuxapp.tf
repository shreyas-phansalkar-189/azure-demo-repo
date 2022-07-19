resource "azurerm_service_plan" "testPaln" {
  name                = "example-app-service-plan"
  resource_group_name = azurerm_resource_group.example.name
  location            = azurerm_resource_group.example.location
  os_type             = "Linux"
  sku_name            = "Y1"
}

resource "azurerm_linux_function_app" "example" {
  name                = "example-linux-function-app"
  resource_group_name = azurerm_resource_group.example.name
  location            = azurerm_resource_group.example.location

  storage_account_name = azurerm_storage_account.storageRulesCheck.name
  service_plan_id      = azurerm_service_plan.testPaln.id

  site_config {
      minimum_tls_version = 1.1
      scm_minimum_tls_version = 1.1
  }
}
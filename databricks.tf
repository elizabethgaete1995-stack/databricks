resource "azurerm_databricks_workspace" "main" {
  name                = var.databricks_workspace_name
  resource_group_name = data.azurerm_resource_group.target.name
  location            = local.effective_location

  # Standard fue retirado para nuevas creaciones.
  sku = "premium"

  # Mantener true mientras no exista Private Link/Private Endpoint.
  public_network_access_enabled = var.public_network_access_enabled

  # Si queda en null, Azure genera automáticamente el Managed Resource Group.
  managed_resource_group_name = var.managed_resource_group_name

  tags = local.common_tags

  lifecycle {
    precondition {
      condition     = lower(local.effective_location) == lower(data.azurerm_resource_group.target.location)
      error_message = "La ubicación configurada debe coincidir con la ubicación del Resource Group existente."
    }
  }
}

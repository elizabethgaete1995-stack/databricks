output "databricks_workspace_resource_id" {
  description = "Resource ID del Azure Databricks Workspace."
  value       = azurerm_databricks_workspace.main.id
}

output "databricks_workspace_id" {
  description = "Identificador interno del workspace."
  value       = azurerm_databricks_workspace.main.workspace_id
}

output "databricks_workspace_url" {
  description = "URL del Azure Databricks Workspace."
  value       = azurerm_databricks_workspace.main.workspace_url
}

output "databricks_managed_resource_group_id" {
  description = "Resource ID del Managed Resource Group creado por Databricks."
  value       = azurerm_databricks_workspace.main.managed_resource_group_id
}

output "effective_subscription_id" {
  description = "Suscripción usada por el provider AzureRM."
  value       = var.subscription_id
}

output "effective_resource_group_name" {
  description = "Resource Group existente utilizado."
  value       = data.azurerm_resource_group.target.name
}

output "effective_location" {
  description = "Región efectiva del despliegue."
  value       = local.effective_location
}

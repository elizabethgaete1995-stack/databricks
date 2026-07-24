locals {
  effective_location = coalesce(
    var.location,
    data.azurerm_resource_group.target.location
  )

  common_tags = merge(
    {
      ManagedBy = "Terraform"
      Service   = "Azure Databricks"
    },
    var.tags
  )
}

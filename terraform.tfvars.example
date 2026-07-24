subscription_id          = "467a4c0a-e34f-4943-8a1a-f4fc3f6d6998"
resource_group_name      = "rg-reporte-prod-brazilsouth-01"
databricks_workspace_name = "dbr-db-reporte-dest01"

# Debe coincidir con la región del Resource Group.
location = "brazilsouth"

# Opcional. El Resource Group indicado no debe existir previamente.
managed_resource_group_name = "rg-dbr-db-reporte-dest01-managed"

# Mantener true si todavía no se implementan Private Link y Private Endpoints.
public_network_access_enabled = true

tags = {
  Environment = "Production"
  Workload    = "reporte"
  Migration   = "Subscription"
}

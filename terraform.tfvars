subscription_id          = "abfc4876-4cfd-4f7a-8bbe-fec4694d3228"
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

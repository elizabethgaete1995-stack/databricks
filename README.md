# Azure Databricks independiente con Terraform

Este proyecto crea únicamente un **Azure Databricks Workspace Premium** dentro de un
Resource Group que ya existe. No vuelve a crear el Resource Group, Storage Account,
Synapse Workspace ni Spark Pools.

## Recursos administrados

- `azurerm_databricks_workspace.main`

El Resource Group se consulta mediante:

- `data.azurerm_resource_group.target`

## Archivos

| Archivo | Función |
|---|---|
| `versions.tf` | Versión de Terraform y provider AzureRM |
| `providers.tf` | Configuración de la suscripción |
| `data.tf` | Consulta del Resource Group existente |
| `locals.tf` | Región efectiva y tags |
| `databricks.tf` | Workspace Databricks Premium |
| `variables.tf` | Variables y validaciones |
| `outputs.tf` | IDs y URL del workspace |
| `terraform.tfvars.example` | Ejemplo de configuración |
| `backend.tf.example` | Ejemplo de estado remoto independiente |

## Preparación

```powershell
Copy-Item terraform.tfvars.example terraform.tfvars
```

Completa al menos:

```hcl
subscription_id           = "<SUBSCRIPTION-ID-DESTINO>"
resource_group_name       = "<RESOURCE-GROUP-EXISTENTE>"
databricks_workspace_name = "dbr-db-reporte-dest01"
location                  = "brazilsouth"
```

El valor de `managed_resource_group_name` es opcional. Si lo utilizas, el nombre no
debe pertenecer a un Resource Group ya existente.

## Despliegue

```powershell
az login
az account set --subscription "<SUBSCRIPTION-ID-DESTINO>"

terraform init
terraform fmt -recursive
terraform validate
terraform plan -out databricks.tfplan
terraform apply databricks.tfplan
```

## Estado independiente

Ejecuta este proyecto desde una carpeta diferente de la infraestructura de Synapse.
Así Databricks tendrá un estado Terraform separado.

También puedes configurar un backend remoto independiente:

```text
databricks/prod.tfstate
```

Para hacerlo, renombra `backend.tf.example` a `backend.tf` y completa sus valores.

## Importación de un workspace existente

Solo si el workspace fue creado manualmente antes del primer `apply`:

```powershell
terraform import `
  azurerm_databricks_workspace.main `
  "/subscriptions/<SUBSCRIPTION-ID>/resourceGroups/<RESOURCE-GROUP>/providers/Microsoft.Databricks/workspaces/<WORKSPACE>"
```

Después ejecuta:

```powershell
terraform plan
```

## Alcance

Este proyecto crea el workspace en Azure Resource Manager. No migra automáticamente:

- Notebooks
- Jobs o Workflows
- Clusters
- Cluster Policies
- Instance Pools
- Secret Scopes
- Librerías
- Permisos internos
- Unity Catalog
- SQL Warehouses
- Private Endpoints o VNet Injection

Esos componentes deben inventariarse y administrarse posteriormente mediante el
provider `databricks`, la CLI o las APIs de Databricks.

## Acceso de red

El ejemplo mantiene:

```hcl
public_network_access_enabled = true
```

No lo cambies a `false` hasta diseñar y desplegar Private Link, Private Endpoints,
DNS privado y los mecanismos de acceso administrativo correspondientes.

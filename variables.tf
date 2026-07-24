variable "subscription_id" {
  description = "ID de la suscripción Azure destino."
  type        = string

  validation {
    condition     = length(trimspace(var.subscription_id)) > 0
    error_message = "subscription_id no puede estar vacío."
  }
}

variable "resource_group_name" {
  description = "Nombre del Resource Group existente donde se desplegará Databricks."
  type        = string

  validation {
    condition     = length(trimspace(var.resource_group_name)) > 0
    error_message = "resource_group_name no puede estar vacío."
  }
}

variable "databricks_workspace_name" {
  description = "Nombre del Azure Databricks Workspace."
  type        = string

  validation {
    condition = (
      length(var.databricks_workspace_name) >= 3 &&
      length(var.databricks_workspace_name) <= 64
    )
    error_message = "databricks_workspace_name debe tener entre 3 y 64 caracteres."
  }
}

variable "location" {
  description = "Región Azure. Si es null, se utiliza la ubicación del Resource Group."
  type        = string
  default     = null
  nullable    = true
}

variable "managed_resource_group_name" {
  description = "Nombre opcional del Managed Resource Group de Databricks. Debe ser nuevo y no existir."
  type        = string
  default     = null
  nullable    = true
}

variable "public_network_access_enabled" {
  description = "Habilita el acceso público al control plane del workspace. Para deshabilitarlo se requiere una arquitectura privada adicional."
  type        = bool
  default     = true
}

variable "tags" {
  description = "Tags adicionales para el workspace."
  type        = map(string)
  default     = {}
}

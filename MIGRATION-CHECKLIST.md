# Checklist de migración de Azure Databricks

## Antes del despliegue

- [ ] Confirmar Subscription ID destino.
- [ ] Confirmar que `Microsoft.Databricks` está registrado.
- [ ] Confirmar permisos Contributor sobre el Resource Group.
- [ ] Confirmar que `dbr-db-reporte-dest01` está disponible.
- [ ] Confirmar que Brazil South es la región requerida.
- [ ] Definir si el acceso será público o privado.
- [ ] Confirmar naming del Managed Resource Group.

## Después del despliegue

- [ ] Validar acceso al workspace.
- [ ] Exportar e importar notebooks.
- [ ] Recrear clusters y políticas.
- [ ] Recrear jobs y schedules.
- [ ] Recrear secret scopes sin exponer secretos.
- [ ] Replicar grupos, usuarios y permisos.
- [ ] Validar conectividad con Storage y Synapse.
- [ ] Validar identidades administradas o service principals.
- [ ] Ejecutar pruebas funcionales.
- [ ] Ejecutar pruebas de rendimiento.
- [ ] Preparar rollback y cutover.

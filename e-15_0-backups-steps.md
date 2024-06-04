## Autor:
- Jorge Octaviop Barcenas Avelar
- Angel Eduardo Oropeza Castañeda
- Ulises Eduardo Antonio García
### Fecha creación: 24 05 2024

## Descripción:

# Configuración
- Verificar que el modo archive log esté habilitado

`archive log list;`

# BackupSet
Conectar como sysdba y ejecutar la siguiente instrucción

`rman target / e-15_1-backupset-script.txt`

# Backup Copy
Conectar como sysdba y ejecutar la siguiente instrucción

`rman target / e-15_2-backupcopy-script.txt`


# Full Backup
`rman target / e-15_3-fullbackup-script.txt`

# Incremental Backup
`rman target / e-15_4-incbackup-script.txt`


#### `*importante haber ejecutarlo desde oracle y export ORACLE_SID=travdip1`
#!/bin/bash
# Este script crea un archivo pfile para una instancia de Oracle.
#
# Pasos del script:
# 1. Establece el valor de ORACLE_SID a "travdip1".
# 2. Define la ruta del archivo pfile basado en ORACLE_SID.
# 3. Genera el contenido del archivo pfile con parámetros de configuración.
# 4. Escribe el contenido en el archivo pfile.
# 5. Verifica y muestra los detalles del archivo creado.

echo "creando archivo pfile"
echo ""

echo "asignando el valor a ORACLE_SID: travdip1"
export ORACLE_SID=travdip1
pfile="${ORACLE_HOME}/dbs/init${ORACLE_SID}.ora"

echo \
"
db_name=${ORACLE_SID}
memory_target=1G
db_domain=fi.unam
db_recovery_file_dest_size=20G
db_recovery_file_dest='/travesia/disk-07/fast-recovery-area'
db_flashback_retention_target=1440
enable_pluggable_database=true
" > ${pfile}

echo "comprobando creación"
echo ""

echo "-l"
ls -l ${pfile}


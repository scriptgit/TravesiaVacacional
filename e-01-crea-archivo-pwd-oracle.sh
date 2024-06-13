#!/bin/bash
# Este script crea un archivo de passwords para una instancia de Oracle.
# 
# Pasos del script:
# 1. Establece el valor de ORACLE_SID a "travdip1".
# 2. Define la ruta del archivo de passwords basado en ORACLE_SID.
# 3. Verifica si el archivo de passwords ya existe.
# 4. Solicita confirmación del usuario para sobreescribir el archivo existente.
# 5. Crea el archivo de passwords con el comando orapwd.
# 6. Verifica y muestra los detalles del archivo creado.

echo "creando archivo de passwords"

echo "asignando el valor a ORACLE_SID: travdip1"
export ORACLE_SID=travdip1

echo "ORACLE_SID: ${ORACLE_SID}"

archivoPwd="${ORACLE_HOME}/dbs/orapw${ORACLE_SID}"


echo "Validando si el archivo existe"

if [ -f "${archivoPwd}" ]; then
  echo "el archivo ya existe presione Enter para sobreescribir"
  echo "Ctrl c - cancelar"
  read existe
fi;

echo "Creando archivo de passwords"
orapwd FORCE=Y \
  FILE=${archivoPwd} \
  FORMAT=12.2 \
  SYS=Hola1234*

echo "Comprobando la creación del archivo"

ls -l ${archivoPwd}

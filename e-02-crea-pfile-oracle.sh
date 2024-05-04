#!/bin/bash

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
" > ${pfile}

echo "comprobando creación"
echo ""

echo "-l"
ls -l ${pfile}


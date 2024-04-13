#!/bin/bash
echo "Creando directorios para crear la BD"
export ORACLE_SID=travdip1

echo "creando directorios para datafiles"
oraData="${ORACLE_BASE}/oradata"
dirDataFiles="${ORACLE_SID^^}"

if [ -d "${oraData}/${dirDataFiles}" ]; then
  echo "El directorio existe, contenido: "
  ls -l ${oraData}/${dirDataFiles}
  read -p "Enter para borrar *.dbf, ctrl C - cancelar"
  cd ${oraData}/${dirDataFiles}
  rm -f *.dbf
fi;

echo "creando directorios"
mkdir -p ${oraData}/${dirDataFiles}

echo "moviendonos a ${oraData}"
cd ${oraData}
echo "Cambiando dueño"
chown oracle:oinstall ${dirDataFiles}

echo "Cambiando permisos a la carpeta de datafiles"
chmod 750 ${dirDataFiles}


echo "Crear Carpteas para Redo logs y Control files"

pMontaje1="/travesia/disk-01"
pMontaje2="/travesia/disk-02"
pMontaje3="/travesia/disk-03"

redoData="app/oracle/oradata/${ORACLE_SID^^}"

if [[ -d "${pMontaje1}/${redoData}" ||  -d "${pMontaje2}/${redoData}" || -d "${pMontaje3}/${redoData}" ]]; then
  echo "Directorios de redo logs existen"
  read -p "Enter para eliminar, Ctrl c - cancelar"
  cd ${pMontaje1}
  rm -f ${redoData}/*.log

  cd ${pMontaje2}
  rm -f ${redoData}/*.log

  cd ${pMontaje3}
  rm -f ${redoData}/*.log

fi;

echo "Creando carpetas de redo logs"
mkdir -p ${pMontaje1}/${redoData}
mkdir -p ${pMontaje2}/${redoData}
mkdir -p ${pMontaje3}/${redoData}


echo "cambiando permisos a la carpeta de redo logs"
echo ""

cd /travesia
chown -R oracle:oinstall disk-*
chmod -R 750 disk-*

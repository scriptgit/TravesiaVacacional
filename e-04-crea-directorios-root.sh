#!/bin/bash
echo "Creando directorios para crear la BD"
export ORACLE_SID=travdip1

echo "creando directorios para datafiles"
#ORACLE_HOME = /u01/app/oracle/product/19.3.0/dbhome_1
#ORACLE_BASE = /u01/app/oracle
oraData="${ORACLE_BASE}/oradata"
dirDataFiles="${ORACLE_SID^^}"

echo "comprobando si el directorio de la base ya existe en la carpeta oradata"
if [ -d "${oraData}/${dirDataFiles}" ]; then
  echo "El directorio existe, contenido: "
  ls -l ${oraData}/${dirDataFiles}
  read -p "Enter para borrar *.dbf, ctrl C - cancelar"
  cd ${oraData}/${dirDataFiles}
  rm -f *.dbf
fi;

echo "creando directorios en directorio oradata"
mkdir -p ${oraData}/${dirDataFiles}

echo "moviendonos a ${oraData}"
cd ${oraData}
echo "Cambiando dueño"
chown oracle:oinstall ${dirDataFiles}

echo "Cambiando permisos a la carpeta de datafiles"
chmod 750 ${dirDataFiles}

#carpeta "raiz" del proyecto
echo "Creando carpeta raiz /travesia"
raiz=/travesia
if [ -d "${raiz}" ]; then
  echo "El directorio existe, contenido: "
  ls -l ${raiz}
  read -p "Enter para borrar, ctrl C - cancelar"
  rm -f ${raiz}
#  En caso de que al momento de intentar abrir la base no se pueda, con el script e-05 debido a que quedaron datos residuales
#  proceder a eliminar las carpetas disk-* con el usuario root manualmente en caso de que no funcione el borrado por script
#  cd ${raiz}
#  borrar todas las carpetas disk con:
#  rm -r *
#  o solo las que poseen datos:
#  rm -r disk-01 disk-02 disk-07
fi;

mkdir -p ${raiz}

echo "cambiando permisos a la carpeta /travesia"
echo ""

cd /
chmod -R 777 travesia

#directorios que simulan los discos
echo "Crear directorios que simularan puntos de montaje"

pMontaje1="disk-01"
pMontaje2="disk-02"
pMontaje3="disk-03"
pMontaje4="disk-04"
pMontaje5="disk-05"
pMontaje6="disk-06"
pMontaje7="disk-07"
pMontaje8="disk-08"

cd ${raiz}
mkdir -p ${pMontaje1}
mkdir -p ${pMontaje2}
mkdir -p ${pMontaje3}
mkdir -p ${pMontaje4}
mkdir -p ${pMontaje5}
mkdir -p ${pMontaje6}
mkdir -p ${pMontaje7}
mkdir -p ${pMontaje8}

#revisamos solo dos ubicaciones ya que una copia estará en la FRA
redoData="app/oracle/oradata/${ORACLE_SID^^}"
if [[ -d "${raiz}/${pMontaje1}/${redoData}" ||  -d "${raiz}/${pMontaje2}/${redoData}"  ]]; then
  echo "Directorios de redo logs existen"
  read -p "Enter para eliminar, Ctrl c - cancelar"
  cd ${raiz}/${pMontaje1}
  rm -f ${redoData}/*.log

  cd ${raiz}/${pMontaje2}
  rm -f ${redoData}/*.log

  
fi;

echo "Creando carpetas de redo logs"
cd ${raiz}
mkdir -p ${pMontaje1}/${redoData}
mkdir -p ${pMontaje2}/${redoData}



echo "Creando carpetas de FRA"
fra=/fast-recovery-area
mkdir -p ${raiz}/${pMontaje7}/${fra}

echo "cambiando permisos a la carpeta de redo logs"
echo ""


cd /travesia
chown -R oracle:oinstall disk-*
chmod -R 750 disk-*

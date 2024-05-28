--@Autor: Jorge Octaviop Barcenas Avelar
-- Angel Eduardo Oropeza Castañeda
-- Ulises Eduardo Antonio García
--@Fecha creación: 24 05 2024
--@Descripción:
!echo "mostrando valor de ORACLE_SID: ${ORACLE_SID}"
pause ¿Es correcto?  Enter para continuar 

define syslogon='sys/systemproy as sysdba'
define app_admin='app_admin'
define app_container='app_container'
define pdb1_admin='admin_administracion_con'
define pdb1_container='administracion_con'
define pdb2_admin='admin_negocios_con'
define pdb2_container='negocio_con'


PROMPT Conectando como SYS
connect &syslogon

set linesize window

PROMPT Consulta que muestre la distribución de todos sus datafiles
col file_name format a20
select file_name, file_id, relative_fno, tablespace_name,
  bytes/(1024*1024) bytes_mb,
  status, autoextensible, increment_by, 
  user_bytes/(1024*1024) user_bytes_mb,
  (bytes-user_bytes)/1024 header_kb,
  online_status
from dba_data_files;

PROMPT Consulta que muestre las ubicaciones de los grupos de Redo Logs



PROMPT Consulta que muestre las ubicaciones de los archive Redo logs



PROMPT consulta que muestre la configuración y uso de la FRA


PROMPT consulta que muestre un resumen simple de los backups realizados


PROMPT consulta que muestre la cantidad en MB que se han almacenado para los diferentes segmentos 
PROMPT de la base de datos. Se deberá realizar una consulta por PDB.

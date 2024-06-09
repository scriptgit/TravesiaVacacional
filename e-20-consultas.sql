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
COLUMN container FORMAT A10
COLUMN datafile FORMAT A40

SELECT c.NAME CONTAINER, c.CON_ID, 
v.name DATAFILE, v.bytes/(1024*1024) bytes_mb 
FROM V$CONTAINERS c, v$datafile v 
where c.con_id = v.con_id  
and c.CON_ID > 2
order by c.CON_ID;

PROMPT Consulta que muestre las ubicaciones de los grupos de Redo Logs
COLUMN member FORMAT A80

SELECT GROUP#, STATUS, MEMBER FROM V$LOGFILE order by GROUP#;

PROMPT Consulta que muestre las ubicaciones de los archive Redo logs
--REVISAR
col name format a70

select recid,name,dest_id,sequence#,
  to_char(first_time,'dd/mm/yyyy hh24:mi:ss') first_time,
  status,to_char(completion_time,'dd/mm/yyyy hh24:mi:ss') completion_time
from v$archived_log;


PROMPT consulta que muestre la configuración y uso de la FRA
COLUMN name FORMAT A50

select NAME, SPACE_LIMIT/(1024*1024) SPACE_LIMIT_mb, SPACE_USED/(1024*1024) SPACE_USED_mb,
SPACE_RECLAIMABLE/(1024*1024) SPACE_RECLAIMABLE_mb, NUMBER_OF_FILES, CON_ID
from v$recovery_file_dest;

PROMPT consulta que muestre un resumen simple de los backups realizados


PROMPT consulta que muestre la cantidad en MB que se han almacenado para los diferentes segmentos 
PROMPT de la base de datos. Se deberá realizar una consulta por PDB.

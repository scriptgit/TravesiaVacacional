--@Autor: Jorge Octaviop Barcenas Avelar
-- Angel Eduardo Oropeza Castañeda
-- Ulises Eduardo Antonio García
--@Descripción: Consultas de datos generales de la base de datos

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
PAUSE [Enter] para continuar
COLUMN container FORMAT A10
COLUMN datafile FORMAT A80

SELECT c.NAME CONTAINER, c.CON_ID, 
v.name DATAFILE, v.bytes/(1024*1024) bytes_mb 
FROM V$CONTAINERS c, v$datafile v 
where c.con_id = v.con_id  
and c.CON_ID > 2
order by c.CON_ID;
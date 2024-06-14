--@Autor: Jorge Octaviop Barcenas Avelar
-- Angel Eduardo Oropeza Castañeda
-- Ulises Eduardo Antonio García
--@Descripción: Consultas de FRA

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

PROMPT consulta que muestre la configuración y uso de la FRA
COLUMN name FORMAT A50

select NAME, SPACE_LIMIT/(1024*1024) SPACE_LIMIT_mb, SPACE_USED/(1024*1024) SPACE_USED_mb,
SPACE_RECLAIMABLE/(1024*1024) SPACE_RECLAIMABLE_mb, NUMBER_OF_FILES, CON_ID
from v$recovery_file_dest;
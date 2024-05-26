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
PROMPT Configurando modo FLASHBACK

prompt Reiniciando la BD en modo mount
shutdown immediate
startup mount

prompt Configurando el periodo de retención para flashback, tres días
--retención de 3 días
alter system set db_flashback_retention_target=4320 scope=both;

prompt Habilitando el modo flashback
alter database flashback on;

prompt Abriendo la BD
alter database  open;

prompt Verificando modo flashback activado
select flashback_on from v$database;
/*
Esperamos ver algo así:
FLASHBACK_ON                                                                                                                                     
------------------                                                                                                                               
YES  
*/

Pause Revisar configuracion, [enter] para continuar

prompt Mostrando tiempo de retención de datos undo y modicando a 30 mins
show parameter undo_ret;

alter system set undo_retention = 1800 scope=spfile;

prompt Mostrando nuevamente tiempo de retención de datos undo
show parameter undo_ret;

PROMPT Listo.
exit
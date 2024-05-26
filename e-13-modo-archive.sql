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


Prompt Conectando como SYS
connect &syslogon

set linesize window
PROMPT Habilitar archive mode 

PROMPT Configurando parámetros
PROMPT Configurando número de Procesos
alter system set log_archive_max_processes=5 scope=spfile;

PROMPT Configurando directorios
alter system set log_archive_dest_1='LOCATION=/travesia/disk-07/fast-recovery-area/TRAVDIP1 MANDATORY' scope=spfile;
alter system set log_archive_dest_2='LOCATION=/travesia/disk-05' scope=spfile;
alter system set log_archive_dest_3='LOCATION=/travesia/disk-06' scope=spfile;

PROMPT Configurando formato del archivo
alter system set log_archive_format='arch_Trav_%t_%s_%r.arc' scope=spfile;

PROMPT Configurando copias mínimas  para considerar el proceso como exitoso (1).
alter system set log_archive_min_succeed_dest=1 scope=spfile;

Prompt Mostrando parámetros antes de continuar.

show spparameter log_archive_max_processes
show spparameter log_archive_dest_1
show spparameter log_archive_dest_2
show spparameter log_archive_format
show spparameter log_archive_min_succeed_dest

Pause Revisar configuracion, [enter] para reiniciar instancia en modo mount

shutdown immediate

PROMPT Iniciando en modo mount
startup mount

PROMPT Habilitando el modo archive
alter database archivelog;

PROMPT Abriendo la BD  para comprobar configuración
alter database open;

PROMPT Comprobando resultados
archive log list
/*
Esperamos ver las siguientes líneas:

Database log mode              Archive Mode
Automatic archival             Enabled
*/
PROMPT Listo.
exit

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
PROMPT mostrando nombre y ubicación de CONTROLFILE
SELECT name FROM v$controlfile;

Pause [Enter] para continuar

--show parameter control_files
ALTER SYSTEM SET CONTROL_FILES='/travesia/disk-07/fast-recovery-area/TRAVDIP1/controlfile/o1_mf_m3xn99nd_.ctl',
    '/travesia/disk-02/app/oracle/oradata/TRAVDIP1/control02.ctl',
    '/travesia/disk-03/app/oracle/oradata/TRAVDIP1/control03.ctl' 
    SCOPE=spfile;

SHUTDOWN IMMEDIATE

-- con usuario oracle crear una copia del ya existente a las dos nuevas rutas control02 y control03

--Haciendo una copia del controlfile para el disk-02
-- En un paso
-- cp /travesia/disk-07/fast-recovery-area/TRAVDIP1/controlfile/nombre_del_controlfile.ctl /travesia/disk-02/app/oracle/oradata/TRAVDIP1/control02.ctl
-- En dos pasos
-- cp /travesia/disk-07/fast-recovery-area/TRAVDIP1/controlfile/nombre_del_controlfile.ctl /travesia/disk-02/app/oracle/oradata/TRAVDIP1/
-- mv /travesia/disk-02/app/oracle/oradata/TRAVDIP1/nombre_del_controlfile.ctl /travesia/disk-02/app/oracle/oradata/TRAVDIP1/control02.ctl
-- En caso de no tener la carpeta de controlfiles para el disk-03 crearla
-- mkdir -p /travesia/disk-03/app/oracle/oradata/TRAVDIP1
-- Copia en un paso
-- cp /travesia/disk-07/fast-recovery-area/TRAVDIP1/controlfile/nombre_del_controlfile.ctl /travesia/disk-03/app/oracle/oradata/TRAVDIP1/control03.ctl
-- Copia en dos pasos
-- cp /travesia/disk-07/fast-recovery-area/TRAVDIP1/controlfile/nombre_del_controlfile.ctl /travesia/disk-03/app/oracle/oradata/TRAVDIP1/
-- mv /travesia/disk-03/app/oracle/oradata/TRAVDIP1/nombre_del_controlfile.ctl /travesia/disk-03/app/oracle/oradata/TRAVDIP1/control03.ctl
Pause [Enter] para continuar, realizar los pasos solicitados como comentario con usuario oracle
STARTUP

PROMPT mostrando nombre y ubicación de los CONTROLFILE
SELECT name FROM v$controlfile;

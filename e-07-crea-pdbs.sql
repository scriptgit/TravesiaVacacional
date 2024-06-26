--@Autor: Jorge Octaviop Barcenas Avelar
-- Angel Eduardo Oropeza Castañeda
-- Ulises Eduardo Antonio García--@Descripción: Creación de pdbs
!echo "mostrando valor de ORACLE_SID: ${ORACLE_SID}"
pause ¿Es correcto?  Enter para continuar 

define syslogon='sys/systemproy as sysdba'
--define t_user='userproy'
--define userlogon='&t_user/&t_user'
define app_admin='app_admin'
define app_container='app_container'
define pdb1_admin='admin_administracion_con'
define pdb1_container='administracion_con'


define pdb2_admin='admin_negocios_con'
define pdb2_container='negocio_con'


Prompt Conectando como SYS
connect &syslogon

Prompt Cambiando sesión a cdb$root
alter session set container = cdb$root;

Prompt Creando el aplication container
CREATE PLUGGABLE DATABASE &app_container as application container
  ADMIN USER &app_admin IDENTIFIED BY &app_admin
  FILE_NAME_CONVERT=('/travesia/disk-01/app/oracle/oradata/TRAVDIP1/PDBSEED/',
  '/travesia/disk-01/app/oracle/oradata/TRAVDIP1/APP-CONTAINER');
  
Prompt Apertura del app container
alter pluggable database &app_container open;

Pause Creando las application pdb containers [Enter] para continuar

alter session set container = &app_container;

create pluggable database &pdb1_container admin user &pdb1_admin identified by &pdb1_admin
  FILE_NAME_CONVERT=('/travesia/disk-01/app/oracle/oradata/TRAVDIP1/PDBSEED/',
  '/travesia/disk-01/app/oracle/oradata/TRAVDIP1/administracion_con');

  
create pluggable database &pdb2_container admin user &pdb2_admin identified by &pdb2_admin
  FILE_NAME_CONVERT=('/travesia/disk-01/app/oracle/oradata/TRAVDIP1/PDBSEED/',
  '/travesia/disk-04/app/oracle/oradata/TRAVDIP1/negocio_con');

show pdbs
prompt listo!!
exit

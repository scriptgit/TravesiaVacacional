--@Autor: Jorge Octaviop Barcenas Avelar
-- Angel Eduardo Oropeza Castañeda
-- Ulises Eduardo Antonio García
--@Descripción: Consulta de redo logs

define syslogon='sys/systemproy as sysdba'
define app_admin='app_admin'
define app_container='app_container'
define pdb1_admin='admin_administracion_con'
define pdb1_container='administracion_con'
define pdb2_admin='admin_negocios_con'
define pdb2_container='negocio_con'

linesize window

Prompt inicio sesion en root
conn &syslogon
alter session set container = cdb$root;

Prompt Mostrando las rutas de los redo logs en cdb$root
SELECT * FROM V$LOGFILE;

Promp Abriendo las pdbs
alter pluggable database &app_container open;
alter pluggable database &pdb1_container open;
alter pluggable database &pdb2_container open;

Prompt cambio de sesion como app_container
alter session set container = &app_container;

Prompt Mostrando las rutas de los redo logs en app_container
SELECT * FROM V$LOGFILE;

Prompt cambio de sesion como administracion pdb
alter session set container = &pdb1_container;

Prompt Mostrando las rutas de los redo logs en administracion_con
SELECT * FROM V$LOGFILE;

Prompt cambio de sesion como negocio pdb
alter session set container = &pdb2_container;

Prompt Mostrando las rutas de los redo logs en negocio_con
SELECT * FROM V$LOGFILE;


exit

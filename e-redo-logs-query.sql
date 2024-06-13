--@Autor: Jorge Octaviop Barcenas Avelar
-- Angel Eduardo Oropeza Castañeda
-- Ulises Eduardo Antonio García
--@Descripción: Consulta de redo logs

define syslogon='sys/systemproy as sysdba'
define common_user='common_user'
define common_user_logon='c##&common_user/&common_user'
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
conn &common_user_logon

Prompt Mostrando las rutas de los redo logs
SELECT * FROM V$LOGFILE;

alter pluggable database &app_container open;
alter pluggable database &pdb1_container open;
alter pluggable database &pdb2_container open;

Prompt inicio de sesion como app_container
conn &syslogon
alter session set container = &app_container;
conn &common_user_logon

Prompt Mostrando las rutas de los redo logs
SELECT * FROM V$LOGFILE;

Prompt inicio de sesion como administracion pdb
conn &syslogon
alter session set container = &administracion_con;
conn &common_user_logon

Prompt Mostrando las rutas de los redo logs
SELECT * FROM V$LOGFILE;

Prompt inicio de sesion como negocio pdb
conn &syslogon
alter session set container = &negocio_con;
conn &common_user_logon

Prompt Mostrando las rutas de los redo logs
SELECT * FROM V$LOGFILE;


exit

define syslogon='sys/systemproy as sysdba'
--define t_user='userproy'
--define userlogon='&t_user/&t_user'
define common_user='common_user'
define common_user_logon='c##&common_user/&common_user'
define app_admin='app_admin'
define app_container='app_container'
define pdb1_admin='admin_administracion_con'
define pdb1_container='administracion_con'


define pdb2_admin='admin_negocios_con'
define pdb2_container='negocio_con'

connect &syslogon
alter pluggable database &app_container open;
alter session set container = &app_container;
alter pluggable database &pdb1_container open;
alter session set container = &pdb1_container;

drop user user02 cascade;
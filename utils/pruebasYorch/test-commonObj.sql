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

conn &syslogon
Prompt Abriendo contenedores 
alter pluggable database &app_container open;
alter pluggable database &pdb1_container open;
alter pluggable database &pdb2_container open;


Prompt Cambiando sesión a &app_container
alter session set container = &app_container;
Prompt Conectando como &app_admin usando nombre de servicio travdip_app
conn &app_admin/&app_admin@travdip_app

CREATE TABLE test sharing=data (
    test_id NUMBER NOT NULL PRIMARY KEY
);

conn &syslogon
Prompt Cambiando sesión a &pdb1_container
alter session set container = &pdb1_container;
PROMPT Conectando como &pdb1_admin usando nombre de servicio travdip_adm
conn &pdb1_admin/&pdb1_admin@travdip_adm

CREATE TABLE test2 (
    test2_id NUMBER NOT NULL PRIMARY KEY,
    test_id NUMBER NOT NULL,
    FOREIGN KEY (test_id) REFERENCES &app_admin.test(test_id)
);

PROMPT limpieza
PAUSE [Enter] para continuar

conn &pdb1_admin/&pdb1_admin@travdip_adm
drop table test2;

conn &app_admin/&app_admin@travdip_app
drop TABLE test;
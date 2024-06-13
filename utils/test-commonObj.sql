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
/*Prompt Abriendo contenedores 
alter pluggable database &app_container open;
alter pluggable database &pdb1_container open;
alter pluggable database &pdb2_container open;
*/

PROMPT Cambiando sesión a &pdb1_container
alter session set container = &pdb1_container;

PROMPT Conectando como &pdb1_admin usando nombre de servicio travdip_adm
conn &pdb1_admin/&pdb1_admin@travdip_adm

CREATE TABLE test (
    test_id NUMBER NOT NULL PRIMARY KEY,
    centro_id NUMBER NOT NULL,
    FOREIGN KEY (centro_id) REFERENCES app_user.centro(centro_id)
);

CREATE TABLE test2 (
    test2_id NUMBER NOT NULL PRIMARY KEY,
    test_id NUMBER NOT NULL,
    FOREIGN KEY (test_id) REFERENCES test(test_id)
);

PROMPT limpieza 
PAUSE [Enter] para continuar

DROP TABLE test2;
DROP TABLE test;

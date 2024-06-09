
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

PROMPT Cambiando sesión a &app_container
alter session set container = &app_container;

PROMPT Iniciamos instalacion de la app
alter pluggable database application t2_app begin install '1.0';

Pause [Enter] Para continuar

PROMPT Creando tbs para usario de app
create tablespace APP_TBS DATAFILE 'app.dbf' size 1m autoextend on next 1m;


PROMPT Creando usuario
create user app_user  identified by app_user
  default tablespace APP_TBS
  quota unlimited on APP_TBS
  container=all;

PROMPT Dando permisos a app_user
grant create session, create table to app_user;

PROMPT Creando tabla Centro para el build de la app
CREATE TABLE app_user.centro sharing=extended data(
    centro_id NUMBER NOT NULL PRIMARY KEY,
    clave_centro NUMBER NOT NULL,
    calle_centro VARCHAR2(20) DEFAULT 'UNKNOWN',
    colonia_centro VARCHAR2(20) DEFAULT 'UNKNOWN',
    numero_centro NUMBER(5) NOT NULL,
    estado_centro VARCHAR2(20) DEFAULT 'UNKNOWN',
    asociacion_id_rid NUMBER,
    CONSTRAINT centro_clave_centro_UK UNIQUE (clave_centro)
);

commit;

PROMPT Terminar el proceso de instalación de la aplicación
alter pluggable database application t2_app end install;

PROMPT Consultar las applicaciones creadas
column app_name format a15
column app_version format a10

select app_name,app_version,app_status
from   dba_applications;

PROMPT Hacemos sync con las PDBS 
Pause [Enter] Para continuar

conn &syslogon
PROMPT Cambiando sesión a &pdb1_container
alter session set container = &pdb1_container;
alter pluggable database application t2_app sync;

PROMPT Verficar la presencia de application objects.
desc app_user.centro;

conn &syslogon
Prompt Cambiando sesión a &pdb2_container
alter session set container = &pdb2_container;
alter pluggable database application t2_app sync;

PROMPT Verficar la presencia de application objects.
desc app_user.centro;
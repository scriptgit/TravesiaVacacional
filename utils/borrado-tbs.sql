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


Prompt inicio sesion en root
conn &syslogon
alter session set container = cdb$root;

Prompt Apertura de las pdbs

alter pluggable database &app_container open;
alter pluggable database &pdb1_container open;
alter pluggable database &pdb2_container open;

Prompt Cambiando sesión a &pdb1_container
alter session set container = &pdb1_container;

DROP TABLESPACE ADMIN_TBS INCLUDING CONTENTS AND DATAFILES;
DROP TABLESPACE ADMIN_EMPLEADO_TBS INCLUDING CONTENTS AND DATAFILES;
DROP TABLESPACE ADMIN_INDICES_TBS INCLUDING CONTENTS AND DATAFILES;

Prompt Cambiando sesión a &pdb2_container
alter session set container = &pdb2_container;

DROP TABLESPACE NEGOCIO_CLIENTE_TBS INCLUDING CONTENTS AND DATAFILES;
DROP TABLESPACE NEGOCIO_MEMBRESIA_TBS INCLUDING CONTENTS AND DATAFILES;
DROP TABLESPACE NEGOCIO_ACTIVIDAD_TBS INCLUDING CONTENTS AND DATAFILES;
DROP TABLESPACE NEGOCIO_MEDIA_TBS INCLUDING CONTENTS AND DATAFILES;
DROP TABLESPACE NEGOCIO_INDICES_TBS INCLUDING CONTENTS AND DATAFILES;


PAUSE Presione [enter] para continuar con borrado de common_user
PROMPT elimnando common_user
DROP USER c##common_user cascade;
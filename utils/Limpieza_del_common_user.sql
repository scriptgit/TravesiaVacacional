define syslogon='sys/systemproy as sysdba'
define app_admin='app_admin'
define app_container='app_container'
define pdb1_admin='admin_administracion_con'
define pdb1_container='administracion_con'
define pdb2_admin='admin_negocios_con'
define pdb2_container='negocio_con'
define common_user='common_user'
define common_user_logon='c##&common_user/&common_user'

conn &syslogon
Prompt Cambiando sesión a &pdb2_container
alter session set container = &pdb2_container;
Prompt conectando como common_user
conn &common_user_logon

DROP TABLE historico_estatus_membresia cascade constraints;
DROP TABLE membresia cascade constraints;
DROP TABLE estatus_membresia cascade constraints;
DROP TABLE juego cascade constraints;
DROP TABLE tipo_juego cascade constraints;
DROP TABLE accesorios cascade constraints;
DROP TABLE deporte cascade constraints;
DROP TABLE tipo_deporte cascade constraints;
DROP TABLE campamento cascade constraints;
DROP TABLE actividad_imagen cascade constraints;
DROP TABLE centro_actividad cascade constraints;
DROP TABLE actividad cascade constraints;
DROP TABLE temporada cascade constraints;
DROP TABLE auto cascade constraints;
DROP TABLE acompaniante cascade constraints;
DROP TABLE visita cascade constraints;
DROP TABLE cliente cascade constraints;

conn &syslogon
Prompt Cambiando sesión a &pdb1_container
alter session set container = &pdb1_container;
Prompt conectando como common_user
conn &common_user_logon

DROP TABLE version_lider cascade constraints;
DROP TABLE lider_centro cascade constraints;
DROP TABLE lider cascade constraints;
DROP TABLE empleado cascade constraints;
DROP TABLE version cascade constraints;
DROP TABLE certificacion cascade constraints;

conn &syslogon
Prompt Cambiando sesión a &app_container
alter session set container = &app_container;
Prompt conectando como common_user
conn &common_user_logon

DROP TABLE centro cascade constraints;

conn &syslogon
Prompt Cambiando sesión a &pdb1_container
alter session set container = &pdb1_container;
Prompt conectando como common_user
conn &common_user_logon

DROP TABLE asociacion cascade constraints;


conn &syslogon
Prompt Cambiando sesión a &pdb2_container
alter session set container = &pdb2_container;
Prompt conectando como common_user
conn &common_user_logon

DROP TABLESPACE NEGOCIO_CLIENTE_TBS INCLUDING CONTENTS AND DATAFILES;
DROP TABLESPACE NEGOCIO_MEMBRESIA_TBS INCLUDING CONTENTS AND DATAFILES;
DROP TABLESPACE NEGOCIO_ACTIVIDAD_TBS INCLUDING CONTENTS AND DATAFILES;
DROP TABLESPACE NEGOCIO_MEDIA_TBS INCLUDING CONTENTS AND DATAFILES;
DROP TABLESPACE NEGOCIO_INDICES_TBS INCLUDING CONTENTS AND DATAFILES;

conn &syslogon
Prompt Cambiando sesión a &pdb1_container
alter session set container = &pdb1_container;
Prompt conectando como common_user
conn &common_user_logon

DROP TABLESPACE ADMIN_TBS INCLUDING CONTENTS AND DATAFILES;
DROP TABLESPACE ADMIN_EMPLEADO_TBS INCLUDING CONTENTS AND DATAFILES;
DROP TABLESPACE ADMIN_INDICES_TBS INCLUDING CONTENTS AND DATAFILES;


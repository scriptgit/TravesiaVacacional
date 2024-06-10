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

PROMPT Conectando como &pdb2_admin usando nombre de servicio travdip_neg
conn &pdb2_admin/&pdb2_admin@travdip_neg

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
Prompt Cambiando sesión a &pdb2_container
alter session set container = &pdb2_container;
drop user app_user CASCADE;

conn &syslogon
PROMPT Cambiando sesión a &pdb1_container
alter session set container = &pdb1_container;

PROMPT Conectando como &pdb1_admin usando nombre de servicio travdip_adm
conn &pdb1_admin/&pdb1_admin@travdip_adm

DROP TABLE version_lider cascade constraints;
DROP TABLE lider_centro cascade constraints;
DROP TABLE lider cascade constraints;
DROP TABLE empleado cascade constraints;
DROP TABLE version cascade constraints;
DROP TABLE certificacion cascade constraints;

DROP TABLE asociacion cascade constraints;
conn &syslogon
PROMPT Cambiando sesión a &pdb1_container
alter session set container = &pdb1_container;
drop user app_user CASCADE;

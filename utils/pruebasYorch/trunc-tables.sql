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

TRUNCATE TABLE historico_estatus_membresia ;
TRUNCATE TABLE membresia ;
TRUNCATE TABLE estatus_membresia ;
TRUNCATE TABLE juego ;
TRUNCATE TABLE tipo_juego ;
TRUNCATE TABLE accesorios ;
TRUNCATE TABLE deporte ;
TRUNCATE TABLE tipo_deporte ;
TRUNCATE TABLE campamento ;
TRUNCATE TABLE actividad_imagen ;
TRUNCATE TABLE centro_actividad ;
TRUNCATE TABLE actividad ;
TRUNCATE TABLE temporada ;
TRUNCATE TABLE auto ;
TRUNCATE TABLE acompaniante ;
TRUNCATE TABLE visita ;
TRUNCATE TABLE cliente ;
conn &syslogon
Prompt Cambiando sesión a &pdb2_container
alter session set container = &pdb2_container;
TRUNCATE user app_user CASCADE;

conn &syslogon
PROMPT Cambiando sesión a &pdb1_container
alter session set container = &pdb1_container;

PROMPT Conectando como &pdb1_admin usando nombre de servicio travdip_adm
conn &pdb1_admin/&pdb1_admin@travdip_adm

TRUNCATE TABLE version_lider ;
TRUNCATE TABLE lider_centro ;
TRUNCATE TABLE lider ;
TRUNCATE TABLE empleado ;
TRUNCATE TABLE version ;
TRUNCATE TABLE certificacion ;

TRUNCATE TABLE asociacion ;
conn &syslogon
PROMPT Cambiando sesión a &pdb1_container
alter session set container = &pdb1_container;
TRUNCATE user app_user CASCADE;

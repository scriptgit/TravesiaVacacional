--@Autor: Jorge Octaviop Barcenas Avelar
-- Angel Eduardo Oropeza Castañeda
-- Ulises Eduardo Antonio García
--@Descripción: Población de tablas

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

Prompt Cambiando sesión a &pdb1_container
alter session set container = &pdb1_container;

ALTER USER &pdb1_admin QUOTA UNLIMITED on ADMIN_TBS;
ALTER USER &pdb1_admin QUOTA UNLIMITED on ADMIN_EMPLEADO_TBS;
ALTER USER &pdb1_admin QUOTA UNLIMITED on ADMIN_INDICES_TBS;

PROMPT Conectando como &pdb1_admin usando nombre de servicio travdip_adm
conn &pdb1_admin/&pdb1_admin@travdip_adm
--usar rutas absolutas

PROMPT Poblando tabla asociacion
@/unam-diplomado-bd/modulos/TravesiaVacacional/Data/ASOCIACION.sql

PROMPT Poblando tabla certificacion
@/unam-diplomado-bd/modulos/TravesiaVacacional/Data/CERTIFICACION.sql

PROMPT Poblando tabla version
@/unam-diplomado-bd/modulos/TravesiaVacacional/Data/VERSION.sql

PROMPT Poblando tabla empleado
@/unam-diplomado-bd/modulos/TravesiaVacacional/Data/EMPLEADO.sql

PROMPT Poblando tabla lider
@/unam-diplomado-bd/modulos/TravesiaVacacional/Data/LIDER.sql

PROMPT Poblando tabla lider_centro
@/unam-diplomado-bd/modulos/TravesiaVacacional/Data/LIDER_CENTRO.sql

PROMPT Poblando tabla version_lider
@/unam-diplomado-bd/modulos/TravesiaVacacional/Data/VERSION_LIDER.sql

conn &syslogon
Prompt Cambiando sesión a &pdb2_container
alter session set container = &pdb2_container;

ALTER USER &pdb2_admin QUOTA UNLIMITED on NEGOCIO_CLIENTE_TBS;
ALTER USER &pdb2_admin QUOTA UNLIMITED on NEGOCIO_MEMBRESIA_TBS;
ALTER USER &pdb2_admin QUOTA UNLIMITED on NEGOCIO_ACTIVIDAD_TBS;
ALTER USER &pdb2_admin QUOTA UNLIMITED on NEGOCIO_MEDIA_TBS;
ALTER USER &pdb2_admin QUOTA UNLIMITED on NEGOCIO_INDICES_TBS;

PROMPT Conectando como &pdb2_admin usando nombre de servicio travdip_neg
conn &pdb2_admin/&pdb2_admin@travdip_neg

PROMPT Poblando tabla cliente
@/unam-diplomado-bd/modulos/TravesiaVacacional/Data/CLIENTE.sql

PROMPT Poblando tabla visita
@/unam-diplomado-bd/modulos/TravesiaVacacional/Data/VISITA.sql

PROMPT Poblando tabla acompaniante
@/unam-diplomado-bd/modulos/TravesiaVacacional/Data/ACOMPANIANTE.sql

PROMPT Poblando tabla auto
@/unam-diplomado-bd/modulos/TravesiaVacacional/Data/AUTO.sql

PROMPT Poblando tabla temporada
@/unam-diplomado-bd/modulos/TravesiaVacacional/Data/TEMPORADA.sql

PROMPT Poblando tabla actividad
@/unam-diplomado-bd/modulos/TravesiaVacacional/Data/ACTIVIDAD.sql

PROMPT Poblando tabla centro_actividad
@/unam-diplomado-bd/modulos/TravesiaVacacional/Data/CENTRO_ACTIVIDAD.sql

PROMPT Poblando tabla actividad_imagen
--@/unam-diplomado-bd/modulos/TravesiaVacacional/Data/ACTIVIDAD_IMAGEN.sql


PROMPT Poblando tabla campamento
@/unam-diplomado-bd/modulos/TravesiaVacacional/Data/CAMPAMENTO.sql

PROMPT Poblando tabla tipo_deporte
@/unam-diplomado-bd/modulos/TravesiaVacacional/Data/TIPO_DEPORTE.sql

PROMPT Poblando tabla deporte
@/unam-diplomado-bd/modulos/TravesiaVacacional/Data/DEPORTE.sql

PROMPT Poblando tabla accesorios
@/unam-diplomado-bd/modulos/TravesiaVacacional/Data/ACCESORIOS.sql

PROMPT Poblando tabla tipo_juego
@/unam-diplomado-bd/modulos/TravesiaVacacional/Data/TIPO_JUEGO.sql

PROMPT Poblando tabla juego
@/unam-diplomado-bd/modulos/TravesiaVacacional/Data/JUEGO.sql

PROMPT Poblando tabla estatus_membresia
@/unam-diplomado-bd/modulos/TravesiaVacacional/Data/ESTATUS_MEMBRESIA.sql

PROMPT Poblando tabla membresia
@/unam-diplomado-bd/modulos/TravesiaVacacional/Data/MEMBRESIA.sql

PROMPT Poblando tabla historico_estatus_membresia
@/unam-diplomado-bd/modulos/TravesiaVacacional/Data/HISTORICO_ESTATUS_MEMBRESIA.sql

PROPMT Poblando tabla pago_actividad
@/unam-diplomado-bd/modulos/TravesiaVacacional/Data/PAGO_ACTIVIDAD.sql

--@Autor: Jorge Octaviop Barcenas Avelar
-- Angel Eduardo Oropeza Castañeda
-- Ulises Eduardo Antonio García
--@Descripción: Creación de tablespaces

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

Prompt Apertura del app container
alter pluggable database &app_container open;

Prompt Apertura de las pdbs
alter pluggable database &pdb1_container open;
alter pluggable database &pdb2_container open;

Prompt Cambiando sesión a &pdb1_container
alter session set container = &pdb1_container;
GRANT CREATE TABLESPACE TO &pdb1_admin;
GRANT CREATE TABLE TO &pdb1_admin;

PROMPT Conectando como &pdb1_admin usando nombre de servicio travdip_adm
conn &pdb1_admin/&pdb1_admin@travdip_adm

create tablespace ADMIN_TBS
    datafile 
        '/travesia/disk-01/app/oracle/oradata/TRAVDIP1/admin_tbs_01.dbf' size 1G
    autoextend on next 10M maxsize 10G
    autoallocate
    segment space management auto
;
Pause [Enter] para continuar
create tablespace ADMIN_EMPLEADO_TBS
    datafile 
        '/travesia/disk-01/app/oracle/oradata/TRAVDIP1/admin_empleado_tbs_01.dbf' size 1G,
        '/travesia/disk-02/app/oracle/oradata/TRAVDIP1/admin_empleado_tbs_02.dbf' size 1G,
        '/travesia/disk-03/app/oracle/oradata/TRAVDIP1/admin_empleado_tbs_03.dbf' size 1G
    autoextend on next 30M maxsize 30G
    autoallocate
    segment space management auto
;

create tablespace ADMIN_INDICES_TBS
    datafile 
        '/travesia/disk-02/app/oracle/oradata/TRAVDIP1/admin_indices_tbs_01.dbf' size 1G,
        '/travesia/disk-03/app/oracle/oradata/TRAVDIP1/admin_indices_tbs_02.dbf' size 1G
    autoextend on next 30M maxsize 15G
    autoallocate
    segment space management auto
;

Prompt volviendose a conectar como sys
conn &syslogon
Prompt Cambiando sesión a &pdb2_container
alter session set container = &pdb2_container;
GRANT CREATE TABLESPACE TO &pdb2_admin;
GRANT CREATE TABLE TO &pdb2_admin;

PROMPT Conectando como &pdb2_admin usando nombre de servicio travdip_neg
conn &pdb2_admin/&pdb2_admin@travdip_neg

create tablespace NEGOCIO_CLIENTE_TBS
    datafile 
        '/travesia/disk-04/app/oracle/oradata/TRAVDIP1/negocio_cliente_tbs_01.dbf' size 1G,
        '/travesia/disk-05/app/oracle/oradata/TRAVDIP1/negocio_cliente_tbs_02.dbf' size 1G,
        '/travesia/disk-06/app/oracle/oradata/TRAVDIP1/negocio_cliente_tbs_03.dbf' size 1G
    autoextend on next 30M maxsize 30G
    autoallocate
    segment space management auto
;
Pause [Enter] para continuar
create tablespace NEGOCIO_MEMBRESIA_TBS
    datafile 
        '/travesia/disk-04/app/oracle/oradata/TRAVDIP1/negocio_membresia_tbs_01.dbf' size 1G,
        '/travesia/disk-05/app/oracle/oradata/TRAVDIP1/negocio_membresia_tbs_02.dbf' size 1G
    autoextend on next 30M maxsize 30G
    autoallocate
    segment space management auto
;

create tablespace NEGOCIO_ACTIVIDAD_TBS
    datafile 
        '/travesia/disk-06/app/oracle/oradata/TRAVDIP1/negocio_actividad_tbs_01.dbf' size 1G
    autoextend on next 10M maxsize 15G
    autoallocate
    segment space management auto
;

create bigfile tablespace NEGOCIO_MEDIA_TBS
    datafile 
        '/travesia/disk-08/app/oracle/oradata/TRAVDIP1/negocio_media_tbs_01.dbf' size 10G
    autoextend on next 1g maxsize 20G
    autoallocate
    segment space management auto
    NOLOGGING
;

create tablespace NEGOCIO_INDICES_TBS
    datafile 
        '/travesia/disk-04/app/oracle/oradata/TRAVDIP1/negocio_indices_tbs_01.dbf' size 1G,
        '/travesia/disk-05/app/oracle/oradata/TRAVDIP1/negocio_indices_tbs_02.dbf' size 1G
    autoextend on next 30M maxsize 15G
    autoallocate
    segment space management auto
;

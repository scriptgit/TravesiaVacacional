--@Autor: Jorge Octaviop Barcenas Avelar
-- Angel Eduardo Oropeza Castañeda
-- Ulises Eduardo Antonio García
--@Fecha creación: 24 05 2024
--@Descripción:


define syslogon='sys/systemproy as sysdba'
--define t_user='userproy'
--define userlogon='&t_user/&t_user'
define app_admin='app_admin'
define app_container='app_container'
define pdb1_admin='admin_administracion_con'
define pdb1_container='administracion_con'


define pdb2_admin='admin_negocios_con'
define pdb2_container='negocio_con'

--TODO: añadir TBs de los indices

Prompt inicio sesion en root
alter session set container = cdb$root;

Prompt Apertura del app container
alter pluggable database &app_container open;

Prompt Crear carpetas con usuario oracle en caso de no tenerlas:
Prompt mkdir -p /travesia/disk-05/app/oracle/oradata/TRAVDIP1
Prompt mkdir -p /travesia/disk-06/app/oracle/oradata/TRAVDIP1
Prompt mkdir -p /travesia/disk-08/app/oracle/oradata/TRAVDIP1
Pause [Enter] para continuar


Prompt Cambiando sesión a &pdb1_container
alter session set container = &pdb1_container;

Prompt Apertura de las pdbs
alter pluggable database &pdb1_container open;
alter pluggable database &pdb2_container open;

create tablespace ADMIN_TBS
    datafile 
        '/travesia/disk-01/app/oracle/oradata/TRAVDIP1/admin_tbs_01.dbf' size 1G
    autoextend on next 10M maxsize 10G
    autoallocate
    segment space management auto
;

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



Prompt Cambiando sesión a &pdb2_container
alter session set container = &pdb2_container;

create tablespace NEGOCIO_CLIENTE_TBS
    datafile 
        '/travesia/disk-04/app/oracle/oradata/TRAVDIP1/negocio_cliente_tbs_01.dbf' size 1G,
        '/travesia/disk-05/app/oracle/oradata/TRAVDIP1/negocio_cliente_tbs_02.dbf' size 1G,
        '/travesia/disk-06/app/oracle/oradata/TRAVDIP1/negocio_cliente_tbs_03.dbf' size 1G
    autoextend on next 30M maxsize 30G
    autoallocate
    segment space management auto
;

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

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

Prompt Cambiando sesión a &pdb1_container
alter session set container = &pdb1_container;

create tablespace ADMIN_TBS
    datafile 
        '/travesia/disk_1/travesia/admin_tbs_01.dbf' size 1G
    autoextend on next 10M maxsize 10G
    autoallocate
    segment space management auto
;

create tablespace ADMIN_EMPLEADO_TBS
    datafile 
        '/travesia/disk_1/travesia/admin_empleado_tbs_01.dbf' size 1G,
        '/travesia/disk_2/travesia/admin_empleado_tbs_02.dbf' size 1G,
        '/travesia/disk_3/travesia/admin_empleado_tbs_03.dbf' size 1G
    autoextend on next 30M maxsize 30G
    autoallocate
    segment space management auto
;

create tablespace ADMIN_INDICES_TBS
    datafile 
        '/travesia/disk_2/travesia/admin_indices_tbs_01.dbf' size 1G,
        '/travesia/disk_3/travesia/admin_indices_tbs_02.dbf' size 1G
    autoextend on next 30M maxsize 15G
    autoallocate
    segment space management auto
;



Prompt Cambiando sesión a &pdb2_container
alter session set container = &pdb2_container;

create tablespace NEGOCIO_CLIENTE_TBS
    datafile 
        '/travesia/disk_4/travesia/negocio_cliente_tbs_01.dbf' size 1G,
        '/travesia/disk_5/travesia/negocio_cliente_tbs_02.dbf' size 1G,
        '/travesia/disk_6/travesia/negocio_cliente_tbs_03.dbf' size 1G
    autoextend on next 30M maxsize 30G
    autoallocate
    segment space management auto
;

create tablespace NEGOCIO_MEMBRESIA_TBS
    datafile 
        '/travesia/disk_4/travesia/negocio_membresia_tbs_01.dbf' size 1G,
        '/travesia/disk_5/travesia/negocio_membresia_tbs_02.dbf' size 1G
    autoextend on next 30M maxsize 30G
    autoallocate
    segment space management auto
;

create tablespace NEGOCIO_ACTIVIDAD_TBS
    datafile 
        '/travesia/disk_6/travesia/negocio_actividad_tbs_01.dbf' size 1G
    autoextend on next 10M maxsize 15G
    autoallocate
    segment space management auto
;

create bigfile tablespace NEGOCIO_MEDIA_TBS
    datafile 
        '/travesia/disk_8/travesia/negocio_media_tbs_01.dbf' size 10G
    autoextend on next 1g maxsize 20G
    autoallocate
    segment space management auto
    NOLOGGING
;

create tablespace NEGOCIO_INDICES_TBS
    datafile 
        '/travesia/disk_4/travesia/negocio_indices_tbs_01.dbf' size 1G,
        '/travesia/disk_5/travesia/negocio_indices_tbs_02.dbf' size 1G
    autoextend on next 30M maxsize 15G
    autoallocate
    segment space management auto
;
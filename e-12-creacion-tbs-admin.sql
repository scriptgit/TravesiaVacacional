--@Autor: Jorge Octaviop Barcenas Avelar
-- Angel Eduardo Oropeza Castañeda
-- Ulises Eduardo Antonio García
--@Fecha creación: 24 05 2024
--@Descripción:


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

--TODO: añadir TBs de los indices

Prompt inicio sesion en root
conn &syslogon
alter session set container = cdb$root;



Pause Creando common_user [Enter] para continuar
CREATE USER c##common_user IDENTIFIED BY common_user CONTAINER=ALL;
GRANT DBA TO c##common_user;
GRANT SYSDBA TO c##common_user CONTAINER=ALL;
GRANT CREATE SESSION TO c##common_user CONTAINER=ALL;
GRANT CREATE ANY TABLE, ALTER ANY TABLE, DROP ANY TABLE TO c##common_user;
GRANT CREATE ANY INDEX, ALTER ANY INDEX, DROP ANY INDEX TO c##common_user;
GRANT CREATE ANY SEQUENCE, ALTER ANY SEQUENCE, DROP ANY SEQUENCE TO c##common_user;
GRANT CREATE TABLESPACE, ALTER TABLESPACE, DROP TABLESPACE TO c##common_user;


Prompt Apertura del app container
alter pluggable database &app_container open;

Prompt Crear carpetas con usuario oracle en caso de no tenerlas:
Prompt mkdir -p /travesia/disk-05/app/oracle/oradata/TRAVDIP1
Prompt mkdir -p /travesia/disk-06/app/oracle/oradata/TRAVDIP1
Prompt mkdir -p /travesia/disk-08/app/oracle/oradata/TRAVDIP1
Pause [Enter] para continuar

Prompt Apertura de las pdbs
alter pluggable database &pdb1_container open;
alter pluggable database &pdb2_container open;

Prompt Cambiando sesión a &pdb1_container
alter session set container = &pdb1_container;
Prompt conectando como common_user
conn &common_user_logon

/*DROP TABLESPACE ADMIN_TBS INCLUDING CONTENTS AND DATAFILES;
DROP TABLESPACE ADMIN_EMPLEADO_TBS INCLUDING CONTENTS AND DATAFILES;
DROP TABLESPACE ADMIN_INDICES_TBS INCLUDING CONTENTS AND DATAFILES;*/

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


Prompt volviendose a conectar como sys
conn &syslogon
Prompt Cambiando sesión a &pdb2_container
alter session set container = &pdb2_container;
Prompt conectando como common_user
conn &common_user_logon

/*DROP TABLESPACE NEGOCIO_CLIENTE_TBS INCLUDING CONTENTS AND DATAFILES;
DROP TABLESPACE NEGOCIO_MEMBRESIA_TBS INCLUDING CONTENTS AND DATAFILES;
DROP TABLESPACE NEGOCIO_ACTIVIDAD_TBS INCLUDING CONTENTS AND DATAFILES;
DROP TABLESPACE NEGOCIO_MEDIA_TBS INCLUDING CONTENTS AND DATAFILES;
DROP TABLESPACE NEGOCIO_INDICES_TBS INCLUDING CONTENTS AND DATAFILES;*/

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

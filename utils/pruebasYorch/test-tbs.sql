define syslogon='sys/systemproy as sysdba'
define app_admin='app_admin'
define app_container='app_container'
define pdb1_admin='admin_administracion_con'
define pdb1_container='administracion_con'


define pdb2_admin='admin_negocios_con'
define pdb2_container='negocio_con'

define user2='user02/user02'
PROMPT Conectando como SYS
connect &syslogon

Prompt inicio sesion en root
alter session set container = cdb$root;

Prompt Apertura del app container
alter pluggable database &app_container open;


Prompt Cambiando sesión a &app_container
alter session set container = &app_container;

Pause [Enter] para continuar

Prompt Apertura de las pdbs
alter pluggable database &pdb1_container open;
--alter pluggable database &pdb2_container open;


Prompt Cambiando sesión a &pdb1_container
alter session set container = &pdb1_container;


PROMPT creando tbs admin_tbs
create tablespace ADMIN_TBS
    datafile 
        '/travesia/disk-01/app/oracle/oradata/TRAVDIP2/admin_tbs_01.dbf' size 1G
    autoextend on next 10M maxsize 10G
    autoallocate
    segment space management auto
;



PROMPT Consulta que muestre la distribución de todos sus datafiles
COLUMN container FORMAT A10
COLUMN datafile FORMAT A40

SELECT c.NAME CONTAINER, c.CON_ID, 
v.name DATAFILE, v.bytes/(1024*1024) bytes_mb 
FROM V$CONTAINERS c, v$datafile v 
where c.con_id = v.con_id  
and c.CON_ID > 1
order by c.CON_ID;

--connect &pdb1_admin/&pdb1_admin
PROMPT creando usario de prueba user02
create user user02 identified by user02
  default tablespace ADMIN_TBS
  quota unlimited on ADMIN_TBS
  CONTAINER = CURRENT;

prompt asignando privilegios de sistema a user02
grant create session, create table to user02;

Pause [Enter] para continuar

--prompt conectando como user02
--connect &user2

prompt creando tabla test01
create table user02.test01(id number);
insert into user02.test01 values(1);

select * from user02.test01;

prompt limpieza
Pause [Enter] para continuar
PROMPT Conectando como SYS
connect &syslogon
/*alter session set container = cdb$root;
SHUTDOWN IMMEDIATE
STARTUP
alter pluggable database &app_container open;
alter session set container = &app_container;
alter pluggable database &pdb1_container open;
alter session set container = &pdb1_container;*/


drop user user02 cascade;
DROP TABLESPACE ADMIN_TBS INCLUDING CONTENTS AND DATAFILES;
--connect &pdb1_admin/&pdb1_admin


/*Pause [Enter] para continuar
Prompt Cambiando sesión a &pdb2_container
alter session set container = &pdb2_container;

PROMPT creando tbs NEGOCIO_ACTIVIDAD_TBS
create tablespace NEGOCIO_ACTIVIDAD_TBS
    datafile 
        '/travesia/disk-06/app/oracle/oradata/TRAVDIP2/negocio_actividad_tbs_01.dbf' size 1G
    autoextend on next 10M maxsize 15G
    autoallocate
    segment space management auto
;
*/


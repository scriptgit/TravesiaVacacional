--@Autor: Jorge Octaviop Barcenas Avelar
-- Angel Eduardo Oropeza Castañeda
-- Ulises Eduardo Antonio García
--@Descripción: Consulta de uso de almacenamiento por segmentos

define syslogon='sys/systemproy as sysdba'
define common_user='common_user'
define common_user_logon='c##&common_user/&common_user'
define app_admin='app_admin'
define app_container='app_container'
define pdb1_admin='admin_administracion_con'
define pdb1_container='administracion_con'
define pdb2_admin='admin_negocios_con'
define pdb2_container='negocio_con'

linesize window

Prompt inicio sesion en root
conn &syslogon
alter session set container = cdb$root;


alter pluggable database &app_container open;
alter pluggable database &pdb1_container open;
alter pluggable database &pdb2_container open;

Prompt inicio de sesion como app_container
conn &syslogon
alter session set container = &app_container;


-- DBA_SEGMENTS
-- DOC https://docs.oracle.com/en/database/oracle/oracle-database/21/refrn/DBA_SEGMENTS.html
Prompt Mostrando el almacenamiento utilizado en app_container
COLUMN owner FORMAT A20
COLUMN SEGMENT_NAME FORMAT A50
SELECT
    owner,
    segment_name,
    segment_type,
    ROUND(SUM(bytes) / (1024 * 1024), 2) AS size_mb
FROM
    dba_segments
WHERE 
    owner not in ('XDB','SYS','SYSTEM')
GROUP BY
    owner, segment_name, segment_type
ORDER BY
    owner, segment_name, segment_type;

PAUSE [Enter] para continuar

Prompt inicio de sesion como administracion pdb
conn &syslogon
alter session set container = &pdb1_container;


-- M Ó D U L O:  A D M I N I S T R A C I Ó N --

-- DBA_SEGMENTS
-- DOC https://docs.oracle.com/en/database/oracle/oracle-database/21/refrn/DBA_SEGMENTS.html
Prompt Mostrando el almacenamiento utilizado en administracion pdb
COLUMN owner FORMAT A20
COLUMN SEGMENT_NAME FORMAT A50
SELECT
    owner,
    segment_name,
    segment_type,
    ROUND(SUM(bytes) / (1024 * 1024), 2) AS size_mb
FROM
    dba_segments
WHERE 
    owner not in ('XDB','SYS','SYSTEM')
GROUP BY
    owner, segment_name, segment_type
ORDER BY
    owner, segment_name, segment_type;

Prompt inicio de sesion como negocio pdb
conn &syslogon
alter session set container = &pdb2_container;

PAUSE [Enter] para continuar
-- M Ó D U L O:  N E G O C I O --

-- DBA_SEGMENTS
-- DOC https://docs.oracle.com/en/database/oracle/oracle-database/21/refrn/DBA_SEGMENTS.html
Prompt Mostrando el almacenamiento utilizado en negocio pdb
COLUMN owner FORMAT A20
COLUMN SEGMENT_NAME FORMAT A50
SELECT
    owner,
    segment_name,
    segment_type,
    ROUND(SUM(bytes) / (1024 * 1024), 2) AS size_mb
FROM
    dba_segments
WHERE 
    owner not in ('XDB','SYS','SYSTEM')
GROUP BY
    owner, segment_name, segment_type
ORDER BY
    owner, segment_name, segment_type;

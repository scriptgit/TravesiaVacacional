--@Autor: Jorge Octaviop Barcenas Avelar
-- Angel Eduardo Oropeza Castañeda
-- Ulises Eduardo Antonio García
--@Descripción: Consulta de archive redo logs

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


-- v$archive_dest 
-- DOC https://docs.oracle.com/en/database/oracle/oracle-database/19/refrn/V-ARCHIVE_DEST.html
-- v$pdbs
-- DOC https://docs.oracle.com/en/database/oracle/oracle-database/19/refrn/V-PDBS.html
Prompt Mostrando las ubicaciones de los archive redo logs
SELECT
    con.name AS pdb_name,
    al.destination
FROM
    v$archive_dest al
JOIN
    v$pdbs con ON al.con_id = con.con_id
WHERE
    al.value IS NOT NULL
ORDER BY
    con.name, al.name;

Prompt inicio de sesion como administracion pdb
conn &syslogon
alter session set container = &pdb1_container;


-- v$archive_dest 
-- DOC https://docs.oracle.com/en/database/oracle/oracle-database/19/refrn/V-ARCHIVE_DEST.html
-- v$pdbs
-- DOC https://docs.oracle.com/en/database/oracle/oracle-database/19/refrn/V-PDBS.html
Prompt Mostrando las ubicaciones de los archive redo logs
SELECT
    con.name AS pdb_name,
    al.destination
FROM
    v$archive_dest al
JOIN
    v$pdbs con ON al.con_id = con.con_id
WHERE
    al.value IS NOT NULL
ORDER BY
    con.name;

Prompt inicio de sesion como negocio pdb
conn &syslogon
alter session set container = &pdb2_container;


-- v$archive_dest 
-- DOC https://docs.oracle.com/en/database/oracle/oracle-database/19/refrn/V-ARCHIVE_DEST.html
-- v$pdbs
-- DOC https://docs.oracle.com/en/database/oracle/oracle-database/19/refrn/V-PDBS.html
Prompt Mostrando las ubicaciones de los archive redo logs
SELECT
    con.name AS pdb_name,
    al.destination
FROM
    v$archive_dest al
JOIN
    v$pdbs con ON al.con_id = con.con_id
WHERE
    al.value IS NOT NULL
ORDER BY
    con.name, al.name;
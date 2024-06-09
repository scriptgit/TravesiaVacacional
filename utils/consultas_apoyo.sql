--@Autor: Jorge Octaviop Barcenas Avelar
-- Angel Eduardo Oropeza Castañeda
-- Ulises Eduardo Antonio García
--@Fecha creación: 24 05 2024
--@Descripción:
!echo "mostrando valor de ORACLE_SID: ${ORACLE_SID}"
pause ¿Es correcto?  Enter para continuar 

define syslogon='sys/systemproy as sysdba'
define app_admin='app_admin'
define app_container='app_container'
define pdb1_admin='admin_administracion_con'
define pdb1_container='administracion_con'
define pdb2_admin='admin_negocios_con'
define pdb2_container='negocio_con'


Prompt Conectando como SYS
connect &syslogon

set linesize window


---  Viewing Identifying Information About Each Container in a CDB
COLUMN NAME FORMAT A8
SELECT NAME, CON_ID, DBID, CON_UID, GUID FROM V$CONTAINERS ORDER BY CON_ID;

--- Viewing Container ID, Name, and Status of Each PDB
COLUMN PDB_NAME FORMAT A15 
SELECT PDB_ID, PDB_NAME, STATUS FROM DBA_PDBS ORDER BY PDB_ID;

-- Viewing the Name and Open Mode of Each PDB
COLUMN NAME FORMAT A15
COLUMN RESTRICTED FORMAT A10
COLUMN OPEN_TIME FORMAT A30
SELECT NAME, OPEN_MODE, RESTRICTED, OPEN_TIME FROM V$PDBS;

--- combre de contenedor y sus datafiles
COLUMN container FORMAT A10
COLUMN datafile FORMAT A80
SELECT c.NAME CONTAINER, c.CON_ID, v.name DATAFILE 
FROM V$CONTAINERS c, v$datafile v where c.con_id = v.con_id  order by c.CON_ID;


--tablespaces
COLUMN tablespace_name  FORMAT A15
SELECT file_name, status, tablespace_name FROM dba_data_files;

--grupos redologs
col member format a40
select GROUP#,TYPE,MEMBER from v$logfile;
select * from v$log;

--info pdb y app containers
COL pdb_NAME FORMAT a15
select pdb_name,application_root,application_pdb,application_seed,application_clone from dba_pdbs;
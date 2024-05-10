--@Autor: Jorge Octaviop Barcenas Avelar
-- Angel Eduardo Oropeza Castañeda
-- Ulises Eduardo Antonio García
--@Fecha creación: 
--@Descripción: creacion de bd

!echo "mostrando valor de ORACLE_SID: ${ORACLE_SID}"
pause ¿Es correcto?  Enter para continuar 

prompt conectando como sys
connect sys/Hola1234* as sysdba

prompt Apagando instancia en caso de estar iniciada previamente
shutdown immediate
    
prompt inicando instancia en modo nomount
startup nomount

prompt habilitando la creacion de una cdb database cambiando el parametro enable_plugabble_database=true en caso de no estarlo
alter system SET enable_pluggable_database=TRUE scope=spfile;
commit;
    
prompt creando una nueva BD: TRAVDIP1

create database travdip1
    user sys identified by systemproy
    user system identified by systemproy
    logfile group 1 (
        'redo01a.log'
      ) size 50m blocksize 512,
    group 2 (
        'redo02a.log'
      ) size 50m blocksize 512,
    group 3 (
        'redo03a.log'
      ) size 50m blocksize 512
    maxloghistory 1
    maxlogfiles 16
    maxlogmembers 3
    maxdatafiles 1024
    character set AL32UTF8
    national character set AL16UTF16
    extent management local
    datafile '/travesia/disk-01/app/oracle/oradata/TRAVDIP1/system01.dbf'
        size 700m reuse autoextend on next 10240k maxsize unlimited
    sysaux datafile '/travesia/disk-01/app/oracle/oradata/TRAVDIP1/sysaux01.dbf'
        size 550m reuse autoextend on next 10240k maxsize unlimited
    default tablespace users
        datafile '/travesia/disk-01/app/oracle/oradata/TRAVDIP1/users01.dbf'
        size 500m reuse autoextend on maxsize unlimited
    default temporary tablespace tempts1
        tempfile '/travesia/disk-01/app/oracle/oradata/TRAVDIP1/temp01.dbf'
        size 20m reuse autoextend on next 640k maxsize unlimited
    undo tablespace undotbs1
        datafile '/travesia/disk-01/app/oracle/oradata/TRAVDIP1/undotbs01.dbf'
        size 200m reuse autoextend on next 5120k maxsize unlimited
    enable pluggable database;

Prompt Homologando passwords
pause Enter para confirmar cambio de passwords!


alter user sys identified by systemproy;
alter user system identified by systemproy;

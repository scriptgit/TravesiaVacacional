--@Autor: Jorge Octaviop Barcenas Avelar
-- Angel Eduardo Oropeza Castañeda
-- Ulises Eduardo Antonio García
--@Fecha creación: 
--@Descripción: creacion directorio

!echo "mostrando valor de ORACLE_SID: ${ORACLE_SID}"
pause ¿Es correcto?  Enter para continuar 

prompt conectando como sys
connect sys/systemproy as sysdba

prompt script catalog
@?/rdbms/admin/catalog.sql

prompt script catproc
@?/rdbms/admin/catproc.sql

prompt script utlrp
@?/rdbms/admin/utlrp.sql

prompt conectando como system
connect system/systemproy

prompt pupbld
@?/sqlplus/admin/pupbld.sql

prompt Apagando instancia en caso de estar iniciada previamente
shutdown immediate
    
prompt inicando instancia en modo nomount
startup

prompt Agregando miembros a grupos de redo logs
alter database add logfile member 
  '/travesia/disk-01/app/oracle/oradata/TRAVDIP1/redo01b.log' to group 1;
alter database add logfile member 
  '/travesia/disk-02/app/oracle/oradata/TRAVDIP1/redo01c.log' to group 1;
alter database add logfile member 
  '/travesia/disk-01/app/oracle/oradata/TRAVDIP1/redo02b.log' to group 2;
alter database add logfile member 
  '/travesia/disk-02/app/oracle/oradata/TRAVDIP1/redo02c.log' to group 2;
alter database add logfile member 
  '/travesia/disk-01/app/oracle/oradata/TRAVDIP1/redo03b.log' to group 3;
alter database add logfile member 
  '/travesia/disk-02/app/oracle/oradata/TRAVDIP1/redo03c.log' to group 3;






prompt listo!!
exit

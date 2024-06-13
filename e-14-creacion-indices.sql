--@Autor: Jorge Octaviop Barcenas Avelar
-- Angel Eduardo Oropeza Castañeda
-- Ulises Eduardo Antonio García
--@Descripción: Creación de índices

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

-- M Ó D U L O:  A D M I N I S T R A C I Ó N --
conn &syslogon

Prompt Cambiando sesión a &pdb1_container
alter session set container = &pdb1_container;

grant create any index to &pdb1_admin; 
PROMPT Conectando como &pdb1_admin usando nombre de servicio travdip_adm
conn &pdb1_admin/&pdb1_admin@travdip_adm

-- TABLA: EMPLEADO
CREATE INDEX ix_empleado_clave
ON empleado(clave)
TABLESPACE admin_indices_tbs;

-- TABLA: ASOCIACION
CREATE INDEX ix_asociacion_clave
ON asociacion(clave)
TABLESPACE admin_indices_tbs;

-- TABLA: CERTIFICACION
CREATE INDEX ix_certificacion_clave
ON certificacion(clave)
TABLESPACE admin_indices_tbs;


-- M Ó D U L O:  N E G O C I O --
conn &syslogon
Prompt Cambiando sesión a &pdb2_container
alter session set container = &pdb2_container;

grant create any index to &pdb2_admin;

PROMPT Conectando como &pdb2_admin usando nombre de servicio travdip_neg
conn &pdb2_admin/&pdb2_admin@travdip_neg

-- TABLA: VISITA
CREATE INDEX ix_visita_cliente
ON visita(cliente_id)
TABLESPACE negocio_indices_tbs;

-- TABLA: CLIENTE
CREATE INDEX ix_cliente_clave_curp
ON cliente(clave, curp)
TABLESPACE negocio_indices_tbs;

-- TABLA: MEMBRESIA
CREATE INDEX ix_membresia_cliente_numero_membresia
ON membresia(numero_membresia)
TABLESPACE negocio_indices_tbs;

-- TABLA: HISTORICO_ESTATUS_MEMBRESIA
CREATE INDEX ix_historico_estatus_membresia_membresia_id
ON historico_estatus_membresia(membresia_id)
TABLESPACE negocio_indices_tbs;

-- TABLA: ACTIVIDAD
CREATE INDEX ix_actividad_clave
ON actividad(clave)
TABLESPACE negocio_indices_tbs;
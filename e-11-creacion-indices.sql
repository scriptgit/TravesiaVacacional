--@Autor: Jorge Octaviop Barcenas Avelar
-- Angel Eduardo Oropeza Castañeda
-- Ulises Eduardo Antonio García
--@Fecha creación: 
--@Descripción:


-- M Ó D U L O:  A D M I N I S T R A C I Ó N --

-- TABLA: EMPLEADO
CREATE INDEX ix_empleado_clave
ON empleado(clave)
TABLESPACE admin_indices_tbs;

-- TABLA: ASOCIACION
CREATE INDEX ix_asociacion_clave
ON asociacion(clave)
TABLESPACE admin_indices_tbs;



-- M Ó D U L O:  N E G O C I O --

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

--@Autor: Jorge Octaviop Barcenas Avelar
-- Angel Eduardo Oropeza Castañeda
-- Ulises Eduardo Antonio García
--@Descripción: Creación de secuencias y triggers

define syslogon='sys/systemproy as sysdba'
--define t_user='userproy'
--define userlogon='&t_user/&t_user'
define app_admin='app_admin'
define app_container='app_container'
define pdb1_admin='admin_administracion_con'
define pdb1_container='administracion_con'


define pdb2_admin='admin_negocios_con'
define pdb2_container='negocio_con'



Prompt Cambiando sesión a &app_container
alter session set container = &app_container;

Prompt creando secuencia

CREATE SEQUENCE centro_seq
    START WITH 1
    INCREMENT BY 1
    NOMAXVALUE
    NOCYCLE;

PROMPT creando trigger

CREATE OR REPLACE TRIGGER trg_asociacion
BEFORE INSERT ON centro
FOR EACH ROW
BEGIN
    SELECT centro_seq.NEXTVAL INTO :NEW.centro_id FROM DUAL;
END;

Prompt Cambiando sesión a &pdb1_container
alter session set container = &pdb1_container;


PROMPT creando secuencias 

CREATE SEQUENCE asociacion_seq
    START WITH 1
    INCREMENT BY 1
    NOMAXVALUE
    NOCYCLE;

CREATE SEQUENCE certificacion_seq
    START WITH 1
    INCREMENT BY 1
    NOMAXVALUE
    NOCYCLE;

CREATE SEQUENCE empleado_seq
    START WITH 1
    INCREMENT BY 1
    NOMAXVALUE
    NOCYCLE;

CREATE SEQUENCE lider_seq
    START WITH 1
    INCREMENT BY 1
    NOMAXVALUE
    NOCYCLE;


CREATE SEQUENCE version_seq
    START WITH 1
    INCREMENT BY 1
    NOMAXVALUE
    NOCYCLE;

CREATE SEQUENCE version_lider_seq
    START WITH 1
    INCREMENT BY 1
    NOMAXVALUE
    NOCYCLE;

PROMPT creando TRIGGERS

CREATE OR REPLACE TRIGGER trg_asociacion
BEFORE INSERT ON asociacion
FOR EACH ROW
BEGIN
    SELECT asociacion_seq.NEXTVAL INTO :NEW.asociacion_id FROM DUAL;
END;


CREATE OR REPLACE TRIGGER trg_certificacion
BEFORE INSERT ON certificacion
FOR EACH ROW
BEGIN
    SELECT certificacion_seq.NEXTVAL INTO :NEW.certificacion_id FROM DUAL;
END;


CREATE OR REPLACE TRIGGER trg_empleado
BEFORE INSERT ON empleado
FOR EACH ROW
BEGIN
    SELECT empleado_seq.NEXTVAL INTO :NEW.empleado_id FROM DUAL;
END;


CREATE OR REPLACE TRIGGER trg_lider
BEFORE INSERT ON lider
FOR EACH ROW
BEGIN
    SELECT lider_seq.NEXTVAL INTO :NEW.lider_id FROM DUAL;
END;



CREATE OR REPLACE TRIGGER trg_version
BEFORE INSERT ON version
FOR EACH ROW
BEGIN
    SELECT version_seq.NEXTVAL INTO :NEW.version_id FROM DUAL;
END;

CREATE OR REPLACE TRIGGER trg_version_lider
BEFORE INSERT ON version_lider
FOR EACH ROW
BEGIN
    SELECT version_lider_seq.NEXTVAL INTO :NEW.version_lider_id FROM DUAL;
END;

Prompt Cambiando sesión a &pdb2_container
alter session set container = &pdb2_container;


PROMPT creando secuencias

CREATE SEQUENCE cliente_seq
    START WITH 1
    INCREMENT BY 1
    NOMAXVALUE
    NOCYCLE;

CREATE SEQUENCE visita_seq
    START WITH 1
    INCREMENT BY 1
    NOMAXVALUE
    NOCYCLE;

CREATE SEQUENCE acompaniante_seq
    START WITH 1
    INCREMENT BY 1
    NOMAXVALUE
    NOCYCLE;

CREATE SEQUENCE auto_seq
    START WITH 1
    INCREMENT BY 1
    NOMAXVALUE
    NOCYCLE;


CREATE SEQUENCE temporada_seq
    START WITH 1
    INCREMENT BY 1
    NOMAXVALUE
    NOCYCLE;


CREATE SEQUENCE actividad_seq
    START WITH 1
    INCREMENT BY 1
    NOMAXVALUE
    NOCYCLE;

CREATE SEQUENCE centro_actividad_seq
    START WITH 1
    INCREMENT BY 1
    NOMAXVALUE
    NOCYCLE;

CREATE SEQUENCE actividad_imagen_seq
    START WITH 1
    INCREMENT BY 1
    NOMAXVALUE
    NOCYCLE;


CREATE SEQUENCE membresia_seq
    START WITH 1
    INCREMENT BY 1
    NOMAXVALUE
    NOCYCLE;

CREATE SEQUENCE tipo_juego_seq
    START WITH 1
    INCREMENT BY 1
    NOMAXVALUE
    NOCYCLE;

CREATE SEQUENCE tipo_deporte_seq
    START WITH 1
    INCREMENT BY 1
    NOMAXVALUE
    NOCYCLE;

CREATE SEQUENCE accesorios_seq
    START WITH 1
    INCREMENT BY 1
    NOMAXVALUE
    NOCYCLE;

CREATE SEQUENCE estatus_membresia_seq
    START WITH 1
    INCREMENT BY 1
    NOMAXVALUE
    NOCYCLE;

CREATE SEQUENCE historico_estatus_membresia_seq
    START WITH 1
    INCREMENT BY 1
    NOMAXVALUE
    NOCYCLE;


PROMPT creando TRIGGERS


CREATE OR REPLACE TRIGGER cliente_trigger
BEFORE INSERT ON cliente
FOR EACH ROW
BEGIN
    SELECT cliente_seq.NEXTVAL
    INTO :NEW.cliente_id
    FROM dual;
END;
/


CREATE OR REPLACE TRIGGER visita_trigger
BEFORE INSERT ON visita
FOR EACH ROW
BEGIN
    SELECT visita_seq.NEXTVAL
    INTO :NEW.visita_id
    FROM dual;
END;



CREATE OR REPLACE TRIGGER acompaniante_trigger
BEFORE INSERT ON acompaniante
FOR EACH ROW
BEGIN
    SELECT acompaniante_seq.NEXTVAL
    INTO :NEW.visita_id
    FROM dual;
END;


CREATE OR REPLACE TRIGGER auto_trigger
BEFORE INSERT ON auto
FOR EACH ROW
BEGIN
    SELECT auto_seq.NEXTVAL
    INTO :NEW.auto_id
    FROM dual;
END;


CREATE OR REPLACE TRIGGER temporada_trigger
BEFORE INSERT ON temporada
FOR EACH ROW
BEGIN
    SELECT temporada_seq.NEXTVAL
    INTO :NEW.temporada_id
    FROM dual;
END;


CREATE OR REPLACE TRIGGER actividad_trigger
BEFORE INSERT ON actividad
FOR EACH ROW
BEGIN
    SELECT actividad_seq.NEXTVAL
    INTO :NEW.actividad_id
    FROM dual;
END;

CREATE OR REPLACE TRIGGER centro_actividad_trigger
BEFORE INSERT ON centro_actividad
FOR EACH ROW
BEGIN
    SELECT centro_actividad_seq.NEXTVAL
    INTO :NEW.centro_actividad_id
    FROM dual;
END;


CREATE OR REPLACE TRIGGER actividad_imagen_trigger
BEFORE INSERT ON actividad_imagen
FOR EACH ROW
BEGIN
    SELECT actividad_imagen_seq.NEXTVAL
    INTO :NEW.imagen_actividad_id
    FROM dual;
END;


CREATE OR REPLACE TRIGGER tipo_deporte_trigger
BEFORE INSERT ON tipo_deporte
FOR EACH ROW
BEGIN
    SELECT tipo_deporte_seq.NEXTVAL
    INTO :NEW.tipo_deporte_id
    FROM dual;
END;


CREATE OR REPLACE TRIGGER accesorios_trigger
BEFORE INSERT ON accesorios
FOR EACH ROW
BEGIN
    SELECT accesorios_seq.NEXTVAL
    INTO :NEW.accesorio_id
    FROM dual;
END;


CREATE OR REPLACE TRIGGER tipo_juego_trigger
BEFORE INSERT ON tipo_juego
FOR EACH ROW
BEGIN
    SELECT tipo_juego_seq.NEXTVAL
    INTO :NEW.tipo_juego_id
    FROM dual;
END;


CREATE OR REPLACE TRIGGER membresia_trigger
BEFORE INSERT ON membresia
FOR EACH ROW
BEGIN
    SELECT membresia_seq.NEXTVAL
    INTO :NEW.membresia_id
    FROM dual;
END;


CREATE OR REPLACE TRIGGER estatus_membresia_trigger
BEFORE INSERT ON estatus_membresia
FOR EACH ROW
BEGIN
    SELECT estatus_membresia_seq.NEXTVAL
    INTO :NEW.estatus_membresia_id
    FROM dual;
END;


CREATE OR REPLACE TRIGGER historico_estatus_membresia_trigger
BEFORE INSERT ON historico_estatus_membresia
FOR EACH ROW
BEGIN
    SELECT historico_estatus_membresia_seq.NEXTVAL
    INTO :NEW.historico_estatus_membresia_id
    FROM dual;
END;
/

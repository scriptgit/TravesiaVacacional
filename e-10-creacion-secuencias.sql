--@Autor: Jorge Octaviop Barcenas Avelar
-- Angel Eduardo Oropeza Castañeda
-- Ulises Eduardo Antonio García
--@Fecha creación: 
--@Descripción: secuencias y triggers


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

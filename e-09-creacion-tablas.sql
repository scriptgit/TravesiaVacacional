--@Autor: Jorge Octaviop Barcenas Avelar
-- Angel Eduardo Oropeza Castañeda
-- Ulises Eduardo Antonio García
--@Fecha creación: 
--@Descripción:


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

CREATE TABLE centro (
    centro_id NUMBER PRIMARY KEY,
    clave_centro NUMBER,
    calle_centro VARCHAR2(20),
    colonia_centro VARCHAR2(20),
    numero_centro NUMBER(5),
    estado_centro VARCHAR2(20),
    asociacion_id_rid NUMBER,
    FOREIGN KEY (asociacion_id_rid) REFERENCES asociacion(asociacion_id)
);



Prompt Cambiando sesión a &pdb1_container
alter session set container = &pdb1_container;


CREATE TABLE asociacion (
    asociacion_id NUMBER PRIMARY KEY,
    clave_asociacion NUMBER,
    calle_asociacion VARCHAR2(20),
    colonia_asociacion VARCHAR2(20),
    numero_asociacion NUMBER(5),
    estado_asociacion VARCHAR2(20),
    delegacion_asociacion VARCHAR2(20),
    telefono_asociacion NUMBER(13)
) tablespace ADMIN_TBS;

CREATE TABLE certificacion (
    certificacion_id NUMBER PRIMARY KEY,
    clave_certificacion NUMBER,
    nombre_certificacion VARCHAR2(20),
    asociacion_id NUMBER,
    FOREIGN KEY (asociacion_id) REFERENCES asociacion(asociacion_id)
)tablespace ADMIN_TBS;

CREATE TABLE empleado (
    empleado_id NUMBER PRIMARY KEY,
    clave_empleado NUMBER,
    nombre_empleado VARCHAR2(20),
    ap_pat_empleado VARCHAR2(20),
    ap_mat_empleado VARCHAR2(20),
    telefono_empleado NUMBER(13),
    encargado_id NUMBER,
    asociacion_id NUMBER,
    FOREIGN KEY (encargado_id) REFERENCES empleado(empleado_id),
    FOREIGN KEY (asociacion_id) REFERENCES asociacion(asociacion_id)
) tablespace ADMIN_EMPLEADO_TBS;

CREATE TABLE lider (
    empleado_id NUMBER PRIMARY KEY,
    FOREIGN KEY (empleado_id) REFERENCES empleado(empleado_id),
    clave_lider NUMBER,
    anios_experiencia NUMBER(2)
) tablespace ADMIN_EMPLEADO_TBS;

CREATE TABLE lider_centro (
    empleado_id NUMBER,
    centro_id NUMBER,
    PRIMARY KEY (empleado_id, centro_id),
    FOREIGN KEY (empleado_id) REFERENCES lider(empleado_id),
    FOREIGN KEY (centro_id) REFERENCES centro(centro_id)
) tablespace ADMIN_EMPLEADO_TBS;


--TODO:  FALTA TABLAS VERSION Y VERSION_LIDER 


Prompt Cambiando sesión a &pdb2_container
alter session set container = &pdb2_container;

CREATE TABLE cliente (
    cliente_id NUMBER PRIMARY KEY,
    clave_cliente NUMBER,
    nombre_cliente VARCHAR2(20),
    ap_paterno VARCHAR2(20),
    ap_materno VARCHAR2(20),
    fecha_nacimiento DATE,
    edad_cliente NUMBER(3),
    curp_cliente VARCHAR2(18),
    estado_civil_cliente VARCHAR2(15),
    telefono_cliente NUMBER(13),
    ocupacion_cliente VARCHAR2(15),
    nivel_educativo_cliente VARCHAR2(10)
) tablespace NEGOCIO_CLIENTE_TBS;

CREATE TABLE visita (
    visita_id NUMBER PRIMARY KEY,
    fecha DATE,
    hora_llegada TIMESTAMP,
    hora_salida TIMESTAMP,
    centro_id NUMBER,
    cliente_id NUMBER,
    FOREIGN KEY (centro_id) REFERENCES centro(centro_id),
    FOREIGN KEY (cliente_id) REFERENCES cliente(cliente_id)
) tablespace NEGOCIO_CLIENTE_TBS;

--TODO: FALTA TABLAS ACOMPAÑANTE Y AUTO

CREATE TABLE temporada(
    temporada_id NUMBER PRIMARY KEY,
    descripcion VARCHAR2(20)
) tablespace NEGOCIO_ACTIVIDAD_TBS;

CREATE TABLE actividad(
    actividad_id NUMBER PRIMARY KEY,
    clave_actividad NUMBER,
    descripcion_actividad VARCHAR(30),
    costo_actividad NUMBER(6),
    --empleado_id_rid NUMBER
) tablespace NEGOCIO_ACTIVIDAD_TBS;

CREATE TABLE centro_actividad(
    centro_actividad_id NUMBER PRIMARY KEY,
    FOREIGN KEY(actividad_id) REFERENCES actividad(actividad_id),
    FOREIGN KEY(temporarda_id) REFERENCES temporada(temporada_id),
    FOREIGN KEY(centro_id) REFERENCES centro(centro_id)
) tablespace NEGOCIO_ACTIVIDAD_TBS;

CREATE TABLE actividad_imagen(
    imagen_actividad_id NUMBER PRIMARY KEY,
    imagen IMAGE,
    FOREIGN KEY(actividad_id) REFERENCES actividad(actividad_id)
) tablespace NEGOCIO_MEDIA_TBS;

CREATE TABLE campamento(
    actividad_id NUMBER PRIMARY KEY,
    nombre_campamento VARCHAR(20),
    duracion_campamento NUMBER(3),
    latitud_campamento VARCHAR(15),
    longitud_campamento VARCHAR(15),
    delegacion_campamento VARCHAR(20),
    numero_campamento NUMBER(3),
    calle_campamento NUMBER(5),
    colonia_campamento VARCHAR(20),
    estado_campamento VARCHAR(20)
    FOREIGN KEY(actividad_id) REFERENCES actividad(actividad_id)
) tablespace NEGOCIO_ACTIVIDAD_TBS;

CREATE TABLE tipo_deporte(
    tipo_deporte_id NUMBER PRIMARY KEY,
    clave_tipo_deporte NUMBER,
    descripcion_tipo_deporte VARCHAR(30)
) tablespace NEGOCIO_ACTIVIDAD_TBS;

CREATE TABLE deporte(
    actividad_id NUMBER PRIMARY KEY,
    horas_entrenamiento NUMBER(3),
    nombre_deporte VARCHAR(15),
    FOREIGN KEY(tipo_deporte_id) REFERENCES tipo_deporte(tipo_deporte_id), 
    FOREIGN KEY(actividad_id) REFERENCES actividad(actividad_id)
) tablespace NEGOCIO_ACTIVIDAD_TBS; 

CREATE TABLE accesorios(
    accesorio_id NUMBER PRIMARY KEY,
    nombre_accesorio VARCHAR(18),
    FOREIGN KEY(actividad_id) REFERENCES actividad(actividad_id)
) tablespace NEGOCIO_ACTIVIDAD_TBS;

CREATE TABLE tipo_juego(
    tipo_juego_id NUMBER PRIMARY KEY,
    clave_tipo_juego NUMBER,
    descripcion_tipo_juego VARCHAR(30),
    nombre_tipo_juego VARCHAR(15)
) tablespace NEGOCIO_ACTIVIDAD_TBS;

CREATE TABLE juego(
    actividad_id NUMBER PRIMARY KEY,
    nombre_juego VARCHAR(20),
    num_participantes NUMBER(2),
    descripcion_juego VARCHAR(30),
    FOREIGN KEY(tipo_juego_id) REFERENCES tipo_juego(tipo_juego_id),
    FOREIGN KEY(actividad_id) REFERENCES actividad(actividad_id)
) tablespace NEGOCIO_ACTIVIDAD_TBS;


--TODO: FALTA TABLAS MEMBRESIA, HISTORICO_ESTATUS_MEMBRESIA Y ESTATUS_MEMBRESIA 
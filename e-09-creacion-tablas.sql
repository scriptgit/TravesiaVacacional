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
    FOREIGN KEY (asociacion_id_rid) REFERENCES asociacion(asociacion_id),
    CONSTRAINT centro_clave_centro_UK UNIQUE (clave_centro)
);




Prompt Cambiando sesión a &pdb1_container
alter session set container = &pdb1_container;

PROMPT creando tablas 

CREATE TABLE asociacion (
    asociacion_id NUMBER PRIMARY KEY,
    clave_asociacion NUMBER ,
    calle_asociacion VARCHAR2(20),
    colonia_asociacion VARCHAR2(20),
    numero_asociacion NUMBER(5),
    estado_asociacion VARCHAR2(20),
    delegacion_asociacion VARCHAR2(20),
    telefono_asociacion NUMBER(13),
    CONSTRAINT asociacion_clave_asociacion_UK UNIQUE (clave_asociacion)
) tablespace ADMIN_TBS;

CREATE TABLE certificacion (
    certificacion_id NUMBER PRIMARY KEY,
    clave_certificacion NUMBER,
    nombre_certificacion VARCHAR2(20),
    asociacion_id NUMBER,
    FOREIGN KEY (asociacion_id) REFERENCES asociacion(asociacion_id),
    CONSTRAINT certificacion_clave_certificacion_UK UNIQUE (clave_certificacion)
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
    FOREIGN KEY (asociacion_id) REFERENCES asociacion(asociacion_id),
    CONSTRAINT empleado_clave_empleado_UK UNIQUE (clave_empleado)
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


CREATE TABLE version (
    version_id NUMBER PRIMARY KEY,
    numero_version NUMBER,
    objetivos VARCHAR2(30),
    temario VARCHAR2(50),
    nivel_version VARCHAR2(10),
    certificacion_id NUMBER,
    CONSTRAINT fk_certificacion_id FOREIGN KEY (certificacion_id) REFERENCES certificacion(certificacion_id)
) tablespace ADMIN_TBS;

CREATE TABLE version_lider (
    version_lider_id NUMBER PRIMARY KEY,
    version_id NUMBER,
    empleado_id NUMBER,
    fecha_obtencion DATE,
    CONSTRAINT fk_version_id FOREIGN KEY (version_id) REFERENCES version(version_id),
    CONSTRAINT fk_empleado_id FOREIGN KEY (empleado_id) REFERENCES lider(empleado_id),
    CONSTRAINT version_lider_version_id_empleado_id_UK UNIQUE (version_id, empleado_id)
) tablespace ADMIN_TBS;



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
    nivel_educativo_cliente VARCHAR2(10),
    CONSTRAINT cliente_clave_cliente_UK UNIQUE (clave_cliente)
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

CREATE TABLE acompaniante (
    visita_id NUMBER PRIMARY KEY,
    nombre VARCHAR2(20),
    ap_paterno VARCHAR2(20),
    ap_materno VARCHAR2(20),
    parentesco VARCHAR2(15),
    edad NUMBER(3),
    ocupacion VARCHAR2(15),
    CONSTRAINT fk_visita_id FOREIGN KEY (visita_id) REFERENCES visita(visita_id)
) tablespace NEGOCIO_CLIENTE_TBS;

CREATE TABLE auto (
    auto_id NUMBER PRIMARY KEY,
    placas VARCHAR2(10) ,
    modelo VARCHAR2(20),
    marca VARCHAR2(20),
    cliente_id NUMBER,
    CONSTRAINT fk_cliente_id FOREIGN KEY (cliente_id) REFERENCES cliente(cliente_id)
) tablespace NEGOCIO_CLIENTE_TBS;


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
    CONSTRAINT actividad_clave_actividad_UK UNIQUE (clave_actividad)
) tablespace NEGOCIO_ACTIVIDAD_TBS;

CREATE TABLE centro_actividad(
    centro_actividad_id NUMBER PRIMARY KEY,
    actividad_id NUMBER,
    temporada_id NUMBER,
    centro_id NUMBER,
    FOREIGN KEY(actividad_id) REFERENCES actividad(actividad_id),
    FOREIGN KEY(temporada_id) REFERENCES temporada(temporada_id),
    FOREIGN KEY(centro_id) REFERENCES centro(centro_id),
    CONSTRAINT centro_actividad_actividad_id_centro_id_UK UNIQUE (actividad_id, temporada_id)
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
    descripcion_tipo_deporte VARCHAR(30),
    CONSTRAINT tipo_deporte_clave_tipo_deporte_UK UNIQUE (clave_tipo_deporte)
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
    nombre_tipo_juego VARCHAR(15),
    CONSTRAINT tipo_juego_clave_tipo_juego_UK UNIQUE (clave_tipo_juego)
) tablespace NEGOCIO_ACTIVIDAD_TBS;

CREATE TABLE juego(
    actividad_id NUMBER PRIMARY KEY,
    nombre_juego VARCHAR(20),
    num_participantes NUMBER(2),
    descripcion_juego VARCHAR(30),
    FOREIGN KEY(tipo_juego_id) REFERENCES tipo_juego(tipo_juego_id),
    FOREIGN KEY(actividad_id) REFERENCES actividad(actividad_id)
) tablespace NEGOCIO_ACTIVIDAD_TBS;

CREATE TABLE membresia (
    membresia_id NUMBER PRIMARY KEY,
    numero_membresia NUMBER,
    fecha_registro DATE,
    numero_tarjeta NUMBER,
    tipo_tarjeta VARCHAR2(15),
    anio_expiracion NUMBER(4),
    mes_expiracion NUMBER(2),
    num_max_invitados NUMBER(1),
    costo_mensual NUMBER(5),
    cliente_id NUMBER,
    estatus_membresia_id NUMBER,
    CONSTRAINT fk_cliente_id FOREIGN KEY (cliente_id) REFERENCES cliente(cliente_id),
    CONSTRAINT fk_estatus_membresia_id FOREIGN KEY (estatus_membresia_id) REFERENCES estatus_membresia(estatus_membresia_id),
    CONSTRAINT membresia_numero_membresia_UK UNIQUE (numero_membresia)
) tablespace NEGOCIO_MEMBRESIA_TBS;

CREATE TABLE estatus_membresia (
    estatus_membresia_id NUMBER PRIMARY KEY,
    estatus_nombre VARCHAR2(10)
)tablespace NEGOCIO_MEMBRESIA_TBS;

CREATE TABLE historico_estatus_membresia (
    historico_estatus_membresia_id NUMBER PRIMARY KEY,
    estatus_membresia_id NUMBER,
    membresia_id NUMBER,
    fecha_cambio DATE,
    motivo_cancelacion VARCHAR2(20),
    CONSTRAINT fk_estatus_membresia_id FOREIGN KEY (estatus_membresia_id) REFERENCES estatus_membresia(estatus_membresia_id),
    CONSTRAINT fk_membresia_id FOREIGN KEY (membresia_id) REFERENCES membresia(membresia_id)
)tablespace NEGOCIO_MEMBRESIA_TBS;

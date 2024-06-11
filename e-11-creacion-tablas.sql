--@Autor: Jorge Octaviop Barcenas Avelar
-- Angel Eduardo Oropeza Castañeda
-- Ulises Eduardo Antonio García
--@Fecha creación: 24 05 2024
--@Descripción:


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


conn &syslogon
alter session set container = cdb$root;
Prompt Abriendo contenedores 
alter pluggable database &app_container open;
alter pluggable database &pdb1_container open;
alter pluggable database &pdb2_container open;

PROMPT Cambiando sesión a &pdb1_container
alter session set container = &pdb1_container;

PROMPT Conectando como &pdb1_admin usando nombre de servicio travdip_adm
conn &pdb1_admin/&pdb1_admin@travdip_adm

PROMPT Creando tablas 

CREATE TABLE asociacion (
    asociacion_id NUMBER NOT NULL PRIMARY KEY,
    clave NUMBER NOT NULL,
    calle VARCHAR2(50) DEFAULT 'UNKNOWN',
    colonia VARCHAR2(50) DEFAULT 'UNKNOWN',
    numero NUMBER(5),
    estado VARCHAR2(50) DEFAULT 'UNKNOWN',
    delegacion VARCHAR2(50) DEFAULT 'UNKNOWN',
    telefono NUMBER(13),
    CONSTRAINT asociacion_clave_UK UNIQUE (clave)
) tablespace ADMIN_TBS;

-- se elimina la creación de la tabla centro ya que fue creada en el script 09 como parte de la aplicación app_user1.centro

CREATE TABLE certificacion (
    certificacion_id NUMBER NOT NULL PRIMARY KEY,
    clave NUMBER NOT NULL,
    nombre VARCHAR2(50) NOT NULL,
    asociacion_id NUMBER NOT NULL,
    FOREIGN KEY (asociacion_id) REFERENCES asociacion(asociacion_id),
    CONSTRAINT certificacion_clave_UK UNIQUE (clave)
)tablespace ADMIN_TBS;
Pause [Enter] para continuar

CREATE TABLE version (
    version_id NUMBER NOT NULL PRIMARY KEY,
    numero_version NUMBER NOT NULL,
    objetivos VARCHAR2(30) DEFAULT 'EMPTY',
    temario VARCHAR2(50) DEFAULT 'EMPTY',
    nivel_version NUMBER(5) NOT NULL,
    certificacion_id NUMBER NOT NULL,
    CONSTRAINT fk_certificacion_id FOREIGN KEY (certificacion_id) REFERENCES certificacion(certificacion_id)
) tablespace ADMIN_TBS;

CREATE TABLE empleado (
    empleado_id NUMBER NOT NULL PRIMARY KEY,
    clave NUMBER NOT NULL,
    nombre VARCHAR2(30) NOT NULL,
    ap_pat VARCHAR2(30) NOT NULL,
    ap_mat VARCHAR2(30) NOT NULL,
    telefono NUMBER(13),
    encargado_id NUMBER ,
    asociacion_id NUMBER NOT NULL,
    FOREIGN KEY (encargado_id) REFERENCES empleado(empleado_id),
    FOREIGN KEY (asociacion_id) REFERENCES asociacion(asociacion_id),
    CONSTRAINT empleado_clave_UK UNIQUE (clave)
) tablespace ADMIN_EMPLEADO_TBS;

CREATE TABLE lider (
    empleado_id NUMBER NOT NULL PRIMARY KEY,
    FOREIGN KEY (empleado_id) REFERENCES empleado(empleado_id),
    clave_lider NUMBER NOT NULL,
    anios_experiencia NUMBER(2) NOT NULL
) tablespace ADMIN_EMPLEADO_TBS;

CREATE TABLE lider_centro (
    empleado_id NUMBER NOT NULL,
    centro_id NUMBER NOT NULL,
    PRIMARY KEY (empleado_id, centro_id),
    FOREIGN KEY (empleado_id) REFERENCES lider(empleado_id),
    FOREIGN KEY (centro_id) REFERENCES app_user1.centro(centro_id)
) tablespace ADMIN_EMPLEADO_TBS;
Pause [Enter] para continuar

CREATE TABLE version_lider (
    version_lider_id NUMBER NOT NULL PRIMARY KEY,
    version_id NUMBER NOT NULL,
    empleado_id NUMBER NOT NULL,
    fecha_obtencion DATE,
    CONSTRAINT fk_version_id FOREIGN KEY (version_id) REFERENCES version(version_id),
    CONSTRAINT fk_empleado_id FOREIGN KEY (empleado_id) REFERENCES lider(empleado_id),
    CONSTRAINT version_lider_version_id_empleado_id_UK UNIQUE (version_id, empleado_id)
) tablespace ADMIN_TBS;

conn &syslogon
Prompt Cambiando sesión a &pdb2_container
alter session set container = &pdb2_container;
PROMPT Conectando como &pdb2_admin usando nombre de servicio travdip_neg
conn &pdb2_admin/&pdb2_admin@travdip_neg

CREATE TABLE cliente (
    cliente_id NUMBER NOT NULL PRIMARY KEY,
    clave NUMBER NOT NULL,
    nombre VARCHAR2(30) NOT NULL,
    ap_paterno VARCHAR2(30) NOT NULL,
    ap_materno VARCHAR2(30) NOT NULL,
    fecha_nacimiento DATE,
    edad NUMBER(3) NOT NULL,
    curp VARCHAR2(20) NOT NULL,
    estado_civil VARCHAR2(15) DEFAULT 'UNKNOWN',
    telefono NUMBER(13),
    ocupacion VARCHAR2(50) DEFAULT 'UNKNOWN',
    nivel_educativo VARCHAR2(40) DEFAULT 'UNKNOWN',
    CONSTRAINT cliente_clave_UK UNIQUE (clave),
    CONSTRAINT cliente_curp_UK UNIQUE (curp)
) tablespace NEGOCIO_CLIENTE_TBS;

CREATE TABLE visita (
    visita_id NUMBER NOT NULL PRIMARY KEY,
    fecha DATE,
    hora_llegada VARCHAR(12),
    hora_salida	VARCHAR(12),
    centro_id NUMBER NOT NULL,
    cliente_id NUMBER NOT NULL,
    FOREIGN KEY (centro_id) REFERENCES app_user1.centro(centro_id),
    FOREIGN KEY (cliente_id) REFERENCES cliente(cliente_id)
) tablespace NEGOCIO_CLIENTE_TBS;

CREATE TABLE acompaniante (
    acompaniante_id NUMBER NOT NULL PRIMARY KEY,
    nombre VARCHAR2(30) NOT NULL,
    ap_paterno VARCHAR2(30) NOT NULL,
    ap_materno VARCHAR2(30) NOT NULL,
    parentesco VARCHAR2(15) DEFAULT 'UNKNOWN',
    edad NUMBER(3) NOT NULL,
    ocupacion VARCHAR2(15) DEFAULT 'UNKNOWN',
     visita_id NUMBER NOT NULL,
    CONSTRAINT fk_visita_id FOREIGN KEY (visita_id) REFERENCES visita(visita_id)
) tablespace NEGOCIO_CLIENTE_TBS;

CREATE TABLE auto (
    auto_id NUMBER NOT NULL PRIMARY KEY,
    placas VARCHAR2(10) NOT NULL,
    modelo VARCHAR2(20) NOT NULL,
    marca VARCHAR2(20) NOT NULL,
    cliente_id NUMBER NOT NULL,
    CONSTRAINT fk_cliente_id FOREIGN KEY (cliente_id) REFERENCES cliente(cliente_id)
) tablespace NEGOCIO_CLIENTE_TBS;

CREATE TABLE temporada(
    temporada_id NUMBER NOT NULL PRIMARY KEY,
    descripcion VARCHAR2(20) DEFAULT 'UNKNOWN'
) tablespace NEGOCIO_ACTIVIDAD_TBS;

CREATE TABLE actividad(
    actividad_id NUMBER NOT NULL PRIMARY KEY,
    clave_actividad_id NUMBER NOT NULL,
    descripcion_actividad VARCHAR(50) DEFAULT 'UNKNOWN',
    costo_actividad NUMBER(6) NOT NULL,
    --empleado_id_rid NUMBER
    CONSTRAINT actividad_clave_actividad_UK UNIQUE (clave_actividad_id)
) tablespace NEGOCIO_ACTIVIDAD_TBS;

CREATE TABLE centro_actividad(
    centro_actividad_id NUMBER NOT NULL PRIMARY KEY,
    actividad_id NUMBER NOT NULL,
    temporada_id NUMBER NOT NULL,
    centro_id NUMBER NOT NULL,
    FOREIGN KEY(actividad_id) REFERENCES actividad(actividad_id),
    FOREIGN KEY(temporada_id) REFERENCES temporada(temporada_id),
    FOREIGN KEY(centro_id) REFERENCES app_user1.centro(centro_id)
) tablespace NEGOCIO_ACTIVIDAD_TBS;

CREATE TABLE actividad_imagen(
    imagen_actividad_id NUMBER NOT NULL PRIMARY KEY,
    imagen BLOB,
    actividad_id NUMBER NOT NULL,
    FOREIGN KEY(actividad_id) REFERENCES actividad(actividad_id)
) tablespace NEGOCIO_MEDIA_TBS;

CREATE TABLE campamento(
    actividad_id NUMBER NOT NULL PRIMARY KEY,
    nombre_campamento VARCHAR(50) NOT NULL,
    duracion_campamento NUMBER(3) NOT NULL,
    latitud_campamento VARCHAR(15),
    longitud_campamento VARCHAR(15),
    delegacion_campamento VARCHAR(20),
    numero_campamento NUMBER(5),
    calle_campamento NUMBER(5),
    colonia_campamento VARCHAR(20),
    estado_campamento VARCHAR(20),
    FOREIGN KEY(actividad_id) REFERENCES actividad(actividad_id)
) tablespace NEGOCIO_ACTIVIDAD_TBS;

CREATE TABLE tipo_deporte(
    tipo_deporte_id NUMBER NOT NULL PRIMARY KEY,
    clave_tipo_deporte NUMBER NOT NULL,
    descripcion_tipo_deporte VARCHAR(50),
    CONSTRAINT tipo_deporte_clave_tipo_deporte_UK UNIQUE (clave_tipo_deporte)
) tablespace NEGOCIO_ACTIVIDAD_TBS;

CREATE TABLE deporte(
    actividad_id NUMBER NOT NULL PRIMARY KEY,
    horas_entrenamiento NUMBER(3) NOT NULL,
    nombre_deporte VARCHAR(30),
    tipo_deporte_id NUMBER(2) NOT NULL,
    FOREIGN KEY(tipo_deporte_id) REFERENCES tipo_deporte(tipo_deporte_id), 
    FOREIGN KEY(actividad_id) REFERENCES actividad(actividad_id)
) tablespace NEGOCIO_ACTIVIDAD_TBS; 

CREATE TABLE accesorios(
    accesorio_id NUMBER NOT NULL PRIMARY KEY,
    nombre_accesorio VARCHAR(30),
    actividad_id NUMBER NOT NULL,
    FOREIGN KEY(actividad_id) REFERENCES actividad(actividad_id)
) tablespace NEGOCIO_ACTIVIDAD_TBS;

CREATE TABLE tipo_juego(
    tipo_juego_id NUMBER NOT NULL PRIMARY KEY,
    clave_tipo_juego NUMBER NOT NULL,
    descripcion_tipo_juego VARCHAR(80),
    nombre_tipo_juego VARCHAR(80),
    CONSTRAINT tipo_juego_clave_tipo_juego_UK UNIQUE (clave_tipo_juego)
) tablespace NEGOCIO_ACTIVIDAD_TBS;

CREATE TABLE juego(
    actividad_id NUMBER NOT NULL PRIMARY KEY,
    nombre_juego VARCHAR(30),
    num_participantes NUMBER(2) NOT NULL,
    descripcion_juego VARCHAR(80),
    tipo_juego_id NUMBER(3) NOT NULL,
    FOREIGN KEY(tipo_juego_id) REFERENCES tipo_juego(tipo_juego_id),
    FOREIGN KEY(actividad_id) REFERENCES actividad(actividad_id)
) tablespace NEGOCIO_ACTIVIDAD_TBS;

CREATE TABLE estatus_membresia (
    estatus_membresia_id NUMBER NOT NULL PRIMARY KEY,
    estatus_nombre VARCHAR2(15) DEFAULT 'VIGENTE'
)tablespace NEGOCIO_MEMBRESIA_TBS;

CREATE TABLE membresia (
    membresia_id NUMBER NOT NULL PRIMARY KEY,
    numero_membresia NUMBER NOT NULL,
    fecha_registro DATE,
    numero_tarjeta NUMBER NOT NULL,
    tipo_tarjeta VARCHAR2(15) DEFAULT 'BASIC',
    anio_expiracion NUMBER(4) NOT NULL,
    mes_expiracion NUMBER(2),
    num_max_invitados NUMBER(1),
    costo_mensual NUMBER(5) NOT NULL,
    cliente_id NUMBER NOT NULL,
    estatus_membresia_id NUMBER NOT NULL,
    CONSTRAINT fk_membresia_cliente_id FOREIGN KEY (cliente_id) REFERENCES cliente(cliente_id),
    CONSTRAINT fk_estatus_membresia_id FOREIGN KEY (estatus_membresia_id) REFERENCES estatus_membresia(estatus_membresia_id),
    CONSTRAINT membresia_numero_membresia_UK UNIQUE (numero_membresia)
) tablespace NEGOCIO_MEMBRESIA_TBS;

CREATE TABLE historico_estatus_membresia (
    historico_estatus_membresia_id NUMBER PRIMARY KEY,
    estatus_membresia_id NUMBER NOT NULL,
    membresia_id NUMBER NOT NULL,
    fecha_cambio DATE,
    motivo_cancelacion VARCHAR2(50),
    CONSTRAINT fk_historico_estatus_membresia_id FOREIGN KEY (estatus_membresia_id) REFERENCES estatus_membresia(estatus_membresia_id),
    CONSTRAINT fk_membresia_id FOREIGN KEY (membresia_id) REFERENCES membresia(membresia_id)
)tablespace NEGOCIO_MEMBRESIA_TBS;

CREATE TABLE pago_actividad 
(
    id_pago	NUMBER NOT NULL PRIMARY KEY,
    cliente_id	NUMBER NOT NULL,
    fecha_pago	DATE,
    actividad_id	NUMBER NOT NULL,
    costo_actividad	NUMBER NOT NULL,
    CONSTRAINT fk_pago_actividad_cliente_id FOREIGN KEY (cliente_id) REFERENCES cliente(cliente_id)
) tablespace NEGOCIO_CLIENTE_TBS;

/*
CREATE TABLE campamento(
    actividad_id NUMBER NOT NULL PRIMARY KEY,
    nombre_campamento VARCHAR(50) NOT NULL,
    duracion_campamento NUMBER(3) NOT NULL,
    latitud_campamento VARCHAR(15),
    longitud_campamento VARCHAR(15),
    delegacion_campamento VARCHAR(20),
    numero_campamento NUMBER(3),
    calle_campamento NUMBER(5),
    colonia_campamento VARCHAR(20),
    estado_campamento VARCHAR(20),
    FOREIGN KEY(actividad_id) REFERENCES actividad(actividad_id)
) tablespace NEGOCIO_ACTIVIDAD_TBS;
 */

INSERT INTO campamento (actividad_id, nombre_campamento, duracion_campamento, latitud_campamento, longitud_campamento, delegacion_campamento, numero_campamento, calle_campamento, colonia_campamento, estado_campamento)
VALUES (1, 'Campamento Aventura', 5, '19.432608', '-99.133209', 'Cuauhtémoc', 101, 1234, 'Centro', 'CDMX');

INSERT INTO campamento (actividad_id, nombre_campamento, duracion_campamento, latitud_campamento, longitud_campamento, delegacion_campamento, numero_campamento, calle_campamento, colonia_campamento, estado_campamento)
VALUES (2, 'Campamento Eco', 3, '19.427024', '-99.167665', 'Miguel Hidalgo', 202, 5678, 'Polanco', 'CDMX');

INSERT INTO campamento (actividad_id, nombre_campamento, duracion_campamento, latitud_campamento, longitud_campamento, delegacion_campamento, numero_campamento, calle_campamento, colonia_campamento, estado_campamento)
VALUES (3, 'Campamento Montaña', 7, '19.434423', '-99.141098', 'Venustiano Carranza', 303, 2345, 'Morelos', 'CDMX');

INSERT INTO campamento (actividad_id, nombre_campamento, duracion_campamento, latitud_campamento, longitud_campamento, delegacion_campamento, numero_campamento, calle_campamento, colonia_campamento, estado_campamento)
VALUES (4, 'Campamento Playa', 4, '19.428832', '-99.180765', 'Álvaro Obregón', 404, 6789, 'San Ángel', 'CDMX');

INSERT INTO campamento (actividad_id, nombre_campamento, duracion_campamento, latitud_campamento, longitud_campamento, delegacion_campamento, numero_campamento, calle_campamento, colonia_campamento, estado_campamento)
VALUES (5, 'Campamento Selva', 6, '19.436912', '-99.131217', 'Benito Juárez', 505, 3456, 'Del Valle', 'CDMX');

INSERT INTO campamento (actividad_id, nombre_campamento, duracion_campamento, latitud_campamento, longitud_campamento, delegacion_campamento, numero_campamento, calle_campamento, colonia_campamento, estado_campamento)
VALUES (6, 'Campamento Deportivo', 5, '19.445623', '-99.121984', 'Coyoacán', 606, 4567, 'Coyoacán', 'CDMX');

INSERT INTO campamento (actividad_id, nombre_campamento, duracion_campamento, latitud_campamento, longitud_campamento, delegacion_campamento, numero_campamento, calle_campamento, colonia_campamento, estado_campamento)
VALUES (7, 'Campamento Aventurero', 3, '19.452362', '-99.110232', 'Iztapalapa', 707, 5678, 'Iztapalapa', 'CDMX');

INSERT INTO campamento (actividad_id, nombre_campamento, duracion_campamento, latitud_campamento, longitud_campamento, delegacion_campamento, numero_campamento, calle_campamento, colonia_campamento, estado_campamento)
VALUES (8, 'Campamento Natural', 4, '19.469841', '-99.107499', 'Xochimilco', 808, 6789, 'Xochimilco', 'CDMX');

INSERT INTO campamento (actividad_id, nombre_campamento, duracion_campamento, latitud_campamento, longitud_campamento, delegacion_campamento, numero_campamento, calle_campamento, colonia_campamento, estado_campamento)
VALUES (9, 'Campamento Rural', 6, '19.482774', '-99.104987', 'Tlalpan', 909, 7890, 'Tlalpan', 'CDMX');

INSERT INTO campamento (actividad_id, nombre_campamento, duracion_campamento, latitud_campamento, longitud_campamento, delegacion_campamento, numero_campamento, calle_campamento, colonia_campamento, estado_campamento)
VALUES (10, 'Campamento Urbano', 5, '19.496032', '-99.102865', 'Azcapotzalco', 101, 8901, 'Azcapotzalco', 'CDMX');
 
commit;
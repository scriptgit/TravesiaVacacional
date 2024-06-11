/*CREATE TABLE juego(
    actividad_id NUMBER NOT NULL PRIMARY KEY,
    nombre_juego VARCHAR(30),
    num_participantes NUMBER(2) NOT NULL,
    descripcion_juego VARCHAR(80),
    tipo_juego_id NUMBER(3) NOT NULL,
    FOREIGN KEY(tipo_juego_id) REFERENCES tipo_juego(tipo_juego_id),
    FOREIGN KEY(actividad_id) REFERENCES actividad(actividad_id)
) tablespace NEGOCIO_ACTIVIDAD_TBS;;
*/

INSERT INTO JUEGO (actividad_id, nombre_juego, num_participantes, descripcion_juego, tipo_juego_id) 
VALUES 
(3, 'Calabozos y mazmorras', '5', 'Partidas de rol de calabozos y mazmorras', '1'); 
INSERT INTO JUEGO (actividad_id, nombre_juego, num_participantes, descripcion_juego, tipo_juego_id) 
VALUES 
(14, 'Juegos de mesa', '3', 'Diversos juegos de mesa de las compañías más importantes', '1'); 
INSERT INTO JUEGO (actividad_id, nombre_juego, num_participantes, descripcion_juego, tipo_juego_id) 
VALUES 
(15, 'Juegos de rol', '5', 'Juegos de rol fuera de Dungeons and Dragons', '1'); 
INSERT INTO JUEGO (actividad_id, nombre_juego, num_participantes, descripcion_juego, tipo_juego_id) 
VALUES 
(16, 'Realidad virtual', '1', 'Experiencia interactiva en un ambiente virtual', '2');

commit;
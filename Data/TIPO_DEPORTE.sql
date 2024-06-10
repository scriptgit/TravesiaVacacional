/*CREATE TABLE TIPO_DEPORTE 
(
    tipo_deporte_id	VARCHAR(512); 
INSERT INTO TIPO_DEPORTE (tipo_deporte_id, clave_tipo_deporte, descripcion_tipo_deporte) VALUES 
    clave_tipo_deporte	INT,
    descripcion_tipo_deporte	VARCHAR(512)
);*/

INSERT INTO TIPO_DEPORTE (tipo_deporte_id, clave_tipo_deporte, descripcion_tipo_deporte) VALUES 
('1', 71641, 'Deporte individual'); 
INSERT INTO TIPO_DEPORTE (tipo_deporte_id, clave_tipo_deporte, descripcion_tipo_deporte) VALUES 
('2', 22819, 'Deporte por equipos'); 
INSERT INTO TIPO_DEPORTE (tipo_deporte_id, clave_tipo_deporte, descripcion_tipo_deporte) VALUES 
('3', 66123, 'Deporte mixto');

commit;
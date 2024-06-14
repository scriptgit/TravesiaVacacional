-- CLIENTES POR TIPO DE TARJETA
SELECT m.tipo_tarjeta, COUNT(*) miembros, SUM(m.costo_mensual) ingresos_mensuales
FROM `animated-cinema-423001-c1.ueag_gold_zone.CLIENTE_DIM` c
INNER JOIN `animated-cinema-423001-c1.ueag_gold_zone.CENTRO_FACT` f
  ON c.cliente_id = f.cliente_id
INNER JOIN `animated-cinema-423001-c1.ueag_gold_zone.MEMBRESIA_DIM` m 
  ON f.membresia_id = m.membresia_id
GROUP BY tipo_tarjeta;

-- AFINIDAD DE ACTIVIDADES
SELECT a.actividad_id, a.descripcion_actividad, COUNT(c.cliente_id) afinidad
FROM `animated-cinema-423001-c1.ueag_gold_zone.CLIENTE_DIM` c
INNER JOIN `animated-cinema-423001-c1.ueag_gold_zone.CENTRO_FACT` f
  ON c.cliente_id = f.cliente_id
INNER JOIN `animated-cinema-423001-c1.ueag_gold_zone.ACTIVIDAD_DIM` a
  ON a.actividad_id = f.actividad_id
GROUP BY a.actividad_id, a.descripcion_actividad
ORDER BY afinidad DESC;


-- ACTIVIDADES QUE MÁS GENERA INGRESOS
SELECT a.descripcion_actividad, SUM(p.costo_actividad) total_ingresos
FROM `animated-cinema-423001-c1.ueag_gold_zone.PAGO_ACTIVIDAD_DIM` p
JOIN `animated-cinema-423001-c1.ueag_gold_zone.ACTIVIDAD_DIM` a
  ON p.actividad_id = a.actividad_id
GROUP BY a.descripcion_actividad
ORDER BY total_ingresos DESC;

-- NÚMERO DE ACTIVIDADES POR TEMPORADA
SELECT t.descripcion, count(DISTINCT(a.actividad_id)) num_actividades
FROM `animated-cinema-423001-c1.ueag_gold_zone.TEMPORADA_DIM` t
INNER JOIN `animated-cinema-423001-c1.ueag_gold_zone.CENTRO_FACT` f
  ON t.temporada_id = f.temporada_id
INNER JOIN `animated-cinema-423001-c1.ueag_gold_zone.ACTIVIDAD_DIM` a
  ON a.actividad_id = f.actividad_id
GROUP BY t.descripcion
ORDER BY num_actividades DESC;

-- DISTRIBUCIÓN DE DATOS DE NIVEL EDUCATIVO DE CLIENTES
SELECT nivel_educativo_cliente, COUNT(*)
FROM `animated-cinema-423001-c1.ueag_gold_zone.CLIENTE_DIM`
GROUP BY nivel_educativo_cliente;
 
-- MEMBRESÍAS REGISTRADAS POR AÑO
SELECT
  EXTRACT(YEAR FROM fecha_registro) AS ano_registro,
  COUNT(*) AS total_registros
FROM
  `animated-cinema-423001-c1.ueag_gold_zone.MEMBRESIA_DIM`
GROUP BY
  ano_registro
ORDER BY
  ano_registro;

-- INGRESOS MENSUALES POR PAGO DE MEMBRESIAS 
SELECT m.tipo_tarjeta,  SUM(costo_mensual) ingreso_mensual
FROM `animated-cinema-423001-c1.ueag_gold_zone.CLIENTE_DIM` c
INNER JOIN `animated-cinema-423001-c1.ueag_gold_zone.CENTRO_FACT` f
  ON c.cliente_id = f.cliente_id
INNER JOIN `animated-cinema-423001-c1.ueag_gold_zone.MEMBRESIA_DIM` m 
  ON f.membresia_id = m.membresia_id
GROUP BY m.tipo_tarjeta;

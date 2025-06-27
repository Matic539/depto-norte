-- 2.1 Poblar dim_ubicacion
INSERT INTO dim_ubicacion(ciudad, direccion)
SELECT DISTINCT ciudad, direccion
FROM arriendos;

-- 2.2 Poblar dim_propiedad
INSERT INTO dim_propiedad(dormitorios, banos, metros2)
SELECT DISTINCT dormitorios, banos, metros2
FROM arriendos;

-- 2.3 Poblar dim_rango_precio
INSERT INTO dim_rango_precio(etiqueta, min_precio_m2, max_precio_m2)
VALUES
	('Bajo',   0,     10000),
  	('Medio',  10001,  20000),
  	('Alto',   20001, 999999);

-- 2.4 Poblar tabla hechos
INSERT INTO fact_arriendos(
  ubicacion_id,
  propiedad_id,
  rango_precio_id,
  precio_total,
  precio_m2
)
SELECT
  du.ubicacion_id,
  dp.propiedad_id,
  drp.rango_precio_id,
  a.precio,
  ROUND(a.precio / NULLIF(a.metros2, 0), 2)
FROM arriendos a
JOIN dim_ubicacion du
  ON du.ciudad = a.ciudad AND du.direccion = a.direccion
JOIN dim_propiedad dp
  ON dp.dormitorios = a.dormitorios AND dp.banos = a.banos AND dp.metros2 = a.metros2
JOIN dim_rango_precio drp
  ON (a.precio / NULLIF(a.metros2, 0)) BETWEEN drp.min_precio_m2 AND drp.max_precio_m2;

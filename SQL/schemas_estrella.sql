-- 1.1 Dimensión fecha
-- CREATE TABLE dim_fecha (
--   fecha_id     SERIAL PRIMARY KEY,
--   fecha        DATE     NOT NULL UNIQUE,
--   ano          INT,
--   mes          INT,
--   dia          INT,
--   trimestre    INT,
--   dia_semana   VARCHAR(10)
-- );

-- 1.2 Dimensión ubicación
CREATE TABLE dim_ubicacion (
  ubicacion_id SERIAL PRIMARY KEY,
  ciudad       VARCHAR(100),
  direccion    TEXT,
  UNIQUE(ciudad, direccion)
);

-- 1.3 Dimensión propiedad
CREATE TABLE dim_propiedad (
  propiedad_id SERIAL PRIMARY KEY,
  dormitorios  INT,
  banos        INT,
  metros2      NUMERIC(8,2),
  UNIQUE(dormitorios, banos, metros2)
);

-- 1.4 Dimensión rango de precio
CREATE TABLE dim_rango_precio (
  rango_precio_id SERIAL PRIMARY KEY,
  etiqueta VARCHAR(20),  -- p.ej. 'Bajo','Medio','Alto'
  min_precio_m2 NUMERIC(12,2),
  max_precio_m2 NUMERIC(12,2)
);

-- 1.5 Tabla de hechos
CREATE TABLE fact_arriendos (
  arriendo_id     SERIAL PRIMARY KEY,
  fecha_id        INT  REFERENCES dim_fecha(fecha_id),
  ubicacion_id    INT  REFERENCES dim_ubicacion(ubicacion_id),
  propiedad_id    INT  REFERENCES dim_propiedad(propiedad_id),
  rango_precio_id INT  REFERENCES dim_rango_precio(rango_precio_id),
  precio_total    NUMERIC(12,2),
  precio_m2       NUMERIC(12,2)
);

Create TABLE arriendos (
	id SERIAL PRIMARY KEY,
	nombre TEXT NOT NULL,
	direccion TEXT NOT NULL,
	ciudad TEXT NOT NULL,
	precio NUMERIC(12,2) NOT NULL,
	dormitorios INTEGER NOT NULL,
	banos INTEGER NOT NULL,
	metros2 NUMERIC(10,2) NOT NULL,
	precio_m2 NUMERIC(12,2) NOT NULL
);
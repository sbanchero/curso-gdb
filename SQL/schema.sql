
CREATE TABLE "Estaciones" ( 
	id_estacion TEXT NOT NULL primary key, 
	"geom" MULTIPOINT, 
	"Nombre" TEXT, 
	"Descripcion" TEXT, 
	"id_cuenca" INTEGER NOT NULL, 
	"id_depto" INTEGER NOT NULL);

CREATE TABLE IF NOT EXISTS "Estaciones" (
    id_estacion integer NOT NULL primary key,
    nombre character varying,
    id_depto integer NOT NULL,
    id_cuenca integer NOT NULL
);

CREATE TABLE IF NOT EXISTS "Sensores" (
    id_sensor integer NOT NULL PRIMARY KEY,
    marca character varying(50),
    tipo character varying
);

CREATE TABLE IF NOT EXISTS "EstacionesTieneSensores" (
    id_estacion TEXT NOT NULL,
    id_sensor integer NOT NULL,
    fecha_colocacion DATETIME  NOT NULL, 
	PRIMARY KEY (id_sensor, id_estacion),
    FOREIGN KEY (id_estacion) REFERENCES "Estaciones",
    FOREIGN KEY (id_sensor) REFERENCES "Sensores"  	
);


CREATE TABLE "Mediciones" (
	 "id_estacion" TEXT NOT NULL,
	 "Fecha" DATETIME  NOT NULL, 
	 "Temperatura_Abrigo_150cm" REAL, 
	 "Temperatura_Abrigo_150cm_Maxima" REAL, 
	 "Temperatura_Abrigo_150cm_Minima" REAL, 
	 "Temperatura_Intemperie_5cm_Minima" REAL, 
	 "Temperatura_Intemperie_50cm_Minima" REAL, 
	 "Temperatura_Suelo_5cm_Media" REAL, 
	 "Temperatura_Suelo_10cm_Media" REAL, 
	 "Temperatura_Inte_5cm" TEXT, 
	 "Temperatura_Intemperie_150cm_Minima" REAL, 
	 "Humedad_Suelo" TEXT, 
	 "Precipitacion_Pluviometrica" REAL, 
	 "Humedad_Media" REAL, 
	 "Evapotranspiracion_Potencial" REAL, 
	 PRIMARY KEY (fecha, id_estacion)
);

-- Registrar una nueva tabla geo
CREATE TABLE "Departamentos" (
	"id_depto" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, 
	"geom" MULTIPOLYGON, 
	"nombre" TEXT(80), 
	"nombre_completo" TEXT(80))

INSERT INTO gpkg_contents VALUES
('Departamentos','features','Departamentos', '', '2023-09-23T19:34:13.463Z',-61.468, -34.141, -57.086, -30.066, 4326)

INSERT INTO gpkg_geometry_columns VALUES
('Departamentos','geom','MULTIPOLYGON', 4326,1,0)

-- OBSERVADOR
CREATE TABLE IF NOT EXISTS "Observadores" (
    id_observador integer NOT NULL PRIMARY KEY,
    nombre character varying(50),
    apellido character varying(50)
);

INSERT INTO gpkg_contents
("table_name", "data_type", "identifier", "description", "last_change", "min_x", "min_y", "max_x", "max_y", "srs_id") 
VALUES ('EstacionesTieneSensores', 'attributes', 'EstacionesTieneSensores', '', '2023-09-23T19:34:13.462Z', NULL, NULL, NULL, NULL, 0);

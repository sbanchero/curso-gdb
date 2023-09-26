-- Estaciones
CREATE TABLE "Estaciones" ( 
	id_estacion TEXT NOT NULL primary key, 
	"geom" MULTIPOINT, 
	"Nombre" TEXT, 
	"Descripcion" TEXT, 
	"id_cuenca" INTEGER NOT NULL, 
	"id_depto" INTEGER NOT NULL,
	FOREIGN KEY (id_cuenca) REFERENCES "Cuencas",
    FOREIGN KEY (id_depto) REFERENCES "Departamentos");

-- Sensores
CREATE TABLE IF NOT EXISTS "Sensores" (
    id_sensor integer NOT NULL PRIMARY KEY,
    marca character varying(50),
    tipo character varying
);

-- EstacionesTieneSensores
CREATE TABLE IF NOT EXISTS "EstacionesTieneSensores" (
    id_estacion TEXT NOT NULL,
    id_sensor integer NOT NULL,
    fecha_colocacion DATETIME  NOT NULL, 
	PRIMARY KEY (id_sensor, id_estacion),
    FOREIGN KEY (id_estacion) REFERENCES "Estaciones",
    FOREIGN KEY (id_sensor) REFERENCES "Sensores"  	
);

-- Mediciones
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
	 PRIMARY KEY (fecha, id_estacion),
	 FOREIGN KEY (id_estacion) REFERENCES "Estaciones"
);

-- Departamentos
CREATE TABLE "Departamentos" (
	"id_depto" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, 
	"geom" MULTIPOLYGON, 
	"nombre" TEXT(80), 
	"nombre_completo" TEXT(80))


-- OBSERVADOR
CREATE TABLE IF NOT EXISTS "Observadores" (
    id_observador integer NOT NULL PRIMARY KEY,
    nombre character varying(50),
    apellido character varying(50)
);

CREATE TABLE "EstacionesObservadores" (
    id_estacion TEXT NOT NULL,
    id_observador integer NOT NULL,
    fecha_revision DATETIME  NOT NULL, 
	PRIMARY KEY (id_observador, id_estacion),
    FOREIGN KEY (id_estacion) REFERENCES "Estaciones",
    FOREIGN KEY (id_observador) REFERENCES "Observadores"  	
);

----------------------------------------------------------
-- Tablas especiales para gestión de datos espaciales
----------------------------------------------------------
-- gpkg_contents: Instrucciones para registro de contenido 
INSERT INTO gpkg_contents VALUES
('Departamentos','features','Departamentos', '', '2023-09-23T19:34:13.463Z',-61.468, -34.141, -57.086, -30.066, 4326)

-- gpkg_geometry_columns: Instrucciones para registro geometrías 
INSERT INTO gpkg_geometry_columns VALUES ('Departamentos','geom','MULTIPOLYGON', 4326,1,0)

INSERT INTO gpkg_contents
("table_name", "data_type", "identifier", "description", "last_change", "min_x", "min_y", "max_x", "max_y", "srs_id") 
VALUES ('EstacionesTieneSensores', 'attributes', 'EstacionesTieneSensores', '', '2023-09-23T19:34:13.462Z', NULL, NULL, NULL, NULL, 0);

-- Consultas 3

-- 1)
SELECT 
	d."id_depto", 
	d."nombre", 
	e.Nombre
FROM 
	"Departamentos" d INNER JOIN Estaciones e
	ON d.id_depto = e.id_depto 
ORDER BY 1

-- 2)
SELECT t1.id_cuenca, t1.CUENCA, sum(Precipitacion_Pluviometrica) pp_mm_ac
FROM 
	(SELECT c."ID_CUENCA", c."CUENCA", e.Nombre, e.id_estacion 
	 FROM Cuencas c INNER JOIN Estaciones e ON c.ID_CUENCA = e.id_cuenca  ORDER BY 1) t1
	INNER JOIN Mediciones m ON t1.id_estacion = m.id_estacion
	WHERE strftime('%Y', Fecha) = '2016'
GROUP BY t1.id_cuenca, t1.CUENCA
ORDER BY 3

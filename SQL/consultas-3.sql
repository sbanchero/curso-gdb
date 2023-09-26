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

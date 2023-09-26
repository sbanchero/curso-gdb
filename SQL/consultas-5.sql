-- Otras Consultas

-- 1) Acumulación en el tiempo de Temperatura_Abrigo_150cm
SELECT date(Fecha), temp150
FROM (SELECT 
			Fecha,
            sum(Temperatura_Abrigo_150cm) OVER (ORDER BY Fecha) AS temp150
      FROM Mediciones
		WHERE   id_estacion='NH0114'
			and strftime('%Y',Fecha)  = '2016'
	)
ORDER BY Fecha;

-- 2) Acumulación en el tiempo de Temperatura_Abrigo_150cm
SELECT date(Fecha1) f_desde, , temp150
FROM (SELECT 
			date(Fecha, '-5 days') Fecha1,
			date(Fecha) Fecha2,
			sum(Temperatura_Abrigo_150cm) OVER (ORDER BY Fecha) AS temp150
      FROM Mediciones
		WHERE id_estacion='NH0114'
		  and strftime('%Y',Fecha)  = '2016'
	)
ORDER BY Fecha;

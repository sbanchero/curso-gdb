-- Consultas 2 

-- 1)
SELECT 
	date(Fecha, 'start of month') F_INICIO, 
	date(Fecha, 'start of month','+1 month','-1 days') F_FIN,
	count(*) dias
FROM "Mediciones"
WHERE 
	id_estacion = '00000A4D'
	and not Temperatura_Abrigo_150cm is null
	and Fecha between date(Fecha, 'start of month') and date(Fecha, 'start of month','+1 month','-1 days')
GROUP BY 1,2
ORDER BY 1

-- 2)
SELECT 
	date(Fecha, 'start of month') F_INICIO, 
	date(Fecha, 'start of month','+1 month','-1 days') F_FIN,
	count(*) dias,
	sum(Precipitacion_Pluviometrica) mm_acum
FROM "Mediciones"
WHERE 
	id_estacion = '00000A4D'
	and Precipitacion_Pluviometrica > 0
	and Fecha between date(Fecha, 'start of month') and date(Fecha, 'start of month','+1 month','-1 days')
GROUP BY 1,2
ORDER BY 1

-- 3)
SELECT 
	id_estacion,
	date(Fecha, 'start of month') F_INICIO, 
	date(Fecha, 'start of month','+1 month','-1 days') F_FIN,
	count(*) dias,
	sum(Precipitacion_Pluviometrica) mm_acum
FROM "Mediciones"
WHERE 
	Precipitacion_Pluviometrica > 0
	and Fecha between date(Fecha, 'start of month') and date(Fecha, 'start of month','+1 month','-1 days')
GROUP BY 1,2
ORDER BY 5 desc
LIMIT 5

-- 4)
SELECT 
	id_estacion,
	date(Fecha, 'start of month') F_INICIO, 
	date(Fecha, 'start of month','+1 month','-1 days') F_FIN,
	count(*) dias,
	sum(Precipitacion_Pluviometrica) mm_acum,
	sum(Precipitacion_Pluviometrica)  / count(*) tasa_pp
FROM "Mediciones"
WHERE 
	Precipitacion_Pluviometrica > 0
	and Fecha between date(Fecha, 'start of month') and date(Fecha, 'start of month','+1 month','-1 days')
GROUP BY 1,2
ORDER BY 6 desc
LIMIT 5

-- 5) Bonus 
SELECT 
			date(Fecha, '-10 days') Fecha1,
			date(Fecha) Fecha2,
			sum(Precipitacion_Pluviometrica) as pp_acum_5d
FROM Mediciones
		WHERE id_estacion='NH0114'
		  and strftime('%Y',Fecha)  = '2016'
GROUP BY 1, 2

-- Výpočet novinky, vzlášť pro adidas, Nike, Pumu, Reebok, zvlášť pro ostatní

-- nastav novinka u všech velikostí artiklů kde je aspoň jedna velikost dostupná za posledních 90 dní (výrobci adidas, Nike, Pumu, Reebok)
UPDATE t1
	SET t1.VPrNovinka = CASE 
		WHEN ISNULL(DateNaSklad,0) > ISNULL(DateNaDod,0) AND DATEDIFF(DAY,DateNaSklad,GETDATE()) < 90 THEN 1 
		WHEN ISNULL(DateNaSklad,0) < ISNULL(DateNaDod,0) AND DATEDIFF(DAY,DateNaDod,GETDATE()) < 90 THEN 1 
		ELSE 0 
	END
FROM dbo.SKz AS t1

LEFT JOIN (
	SELECT MIN(VPrLogDostDatum) as DateNaSklad, VPrEAN
	FROM dbo.VTbLogDost
	WHERE VPrZmenaKde = 'false' AND  VPrZmenaCo = 'true'
	GROUP BY VPrEAN
) AS t2
ON t1.EAN = t2.VPrEAN

LEFT JOIN (
	SELECT MIN(VPrLogDostDatum) as DateNaDod, VPrEAN
	FROM dbo.VTbLogDost
	WHERE VPrZmenaKde = 'true' AND  VPrZmenaCo = 'true'
	GROUP BY VPrEAN	
) AS t3
ON t1.EAN = t3.VPrEAN

WHERE Vyrobce IN ('adidas','Nike','Puma','Reebok')

-- SELECT pro věci aktuální kolekce pro ostatní výrobce:
SELECT t1.ID, EAN, Nazev, Vyrobce VPrNovinka, ValText, qYear, qQuarter
FROM dbo.SKz as t1
LEFT JOIN (
	SELECT ID, RefAG, ValText, LEFT(ValText,2) as qYear, RIGHT(ValText,1) as qQuarter
	FROM dbo.SkRefParam
	WHERE ValText IS NOT NULL and RefParam = 6
) as t2
ON t1.ID = t2.RefAg
WHERE 
	RefSklad = 18 and 
	qYear = RIGHT(YEAR(GETDATE()),2)
	AND 
	qQuarter = (CASE 
		WHEN MONTH(GETDATE()) IN (1,2,3) THEN 1
		WHEN MONTH(GETDATE()) IN (4,5,6) THEN 2
		WHEN MONTH(GETDATE()) IN (7,8,9) THEN 3
		WHEN MONTH(GETDATE()) IN (10,11,12) THEN 4
	END) AND 
	Vyrobce NOT IN ('adidas','Nike','Puma','Reebok')

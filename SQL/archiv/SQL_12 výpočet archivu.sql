-- po otestování v SQL Studiu přepsat DB názvy na $DB_BS$!!
UPDATE t3
	SET t3.archive = CASE 
		WHEN StavZ = 0 AND ISNULL(VPrDodPocet,0) < 5 AND DVyp IS NOT NULL AND DATEDIFF(DAY,DVyp,GETDATE()) > 0 THEN 1
		ELSE 0
	END
FROM $DB_BS$.dbo.SKzEx AS t3
LEFT JOIN (
	SELECT ID, EAN, DatCreate, RefSklad, Nazev, Vyrobce, StavZ, VPrDodPocet, VPrGledis, VPrGledis2
	FROM dbo.SKz
) AS t1
on t3.Id = t1.ID
LEFT JOIN (
	SELECT MAX(VPrLogDostDatum) as DVyp, VPrRefEAN
	FROM dbo.VTbLogDost
	WHERE VPrZmenaCo = 'false'
	GROUP BY VPrRefEAN
) AS t2
on t1.EAN = t2.VPrRefEAN
WHERE Vyrobce != 'Ryby' AND RefSklad = 18 AND EAN IS NOT NULL

/*
SELECT
	t3.Id, t1.EAN, DatCreate, Nazev, StavZ, VPrDodPocet, DVyp, CASE 
		WHEN StavZ = 0 AND ISNULL(VPrDodPocet,0) < 5 AND DVyp IS NOT NULL AND DATEDIFF(DAY,DVyp,GETDATE()) > 0 THEN 1
		ELSE 0
	END as IsArchive
FROM [bs_StwPh_28311159_2015].dbo.SKzEx AS t3
LEFT JOIN (
	SELECT ID, EAN, DatCreate, RefSklad, Nazev, Vyrobce, StavZ, VPrDodPocet, VPrGledis, VPrGledis2
	FROM dbo.SKz
) AS t1
on t3.Id = t1.ID
LEFT JOIN (
	SELECT MAX(VPrLogDostDatum) as DVyp, VPrRefEAN
	FROM dbo.VTbLogDost
	WHERE VPrZmenaCo = 'false'
	GROUP BY VPrRefEAN
) AS t2
on t1.EAN = t2.VPrRefEAN
WHERE Vyrobce != 'Ryby' AND RefSklad = 18 AND EAN IS NOT NULL
ORDER BY IsArchive
*/
-- po otestování v SQL Studiu přepsat DB názvy na $DB_BS$!!
UPDATE t3
	SET t3.archive = CASE
  		--WHEN VPrDodSklad = 'Ryby' THEN 0
		WHEN StavZ-objedp-rezer-Reklam <= 0 AND ISNULL(VPrDodPocet,0) <= 5 AND DVyp IS NOT NULL AND DATEDIFF(DAY,DVyp,GETDATE()) >= 0 THEN 1 -- archiv pro věci, které nejsou dostupné déle jak x dní
		WHEN Stavz-objedp-rezer-Reklam <= 0 AND ISNULL(VPrDodPocet,0) > 5 AND VPrDodDatum IS NOT NULL AND DATEDIFF(DAY,GETDATE(),ISNULL(VPrDodDatum,0)) > 4 THEN 1 --archiv pro věci které jsou skladem pouze u dodavatele a za více jak 4 dny
    	WHEN StavZ-objedp-rezer-Reklam <= 0 AND ISNULL(VPrDodPocet,0) <= 5 AND DNas IS NULL THEN 1 --archiv pro věci které se ani jednou nenaskladnily
		WHEN StavZ-objedp-rezer-Reklam <= 0 AND ISNULL(VPrDodPocet,0) <= 5 AND DVyp IS NULL THEN 1 -- archiv pro věci, které jsou rezervované, ale ještě skladem. U těchto se nebere v potaz jak dlouho nejsou dostupné, protože ještě nemají DVyp
    ELSE 0
	END
FROM $DB_BS$.dbo.SKzEx AS t3
LEFT JOIN (
	SELECT ID, ids, EAN, RelSkTyp, DatCreate, RefSklad, Nazev, VPrDodSklad, StavZ, objedp, rezer, Reklam, VPrDodPocet, VPrGledis, VPrGledis2, VPrDodDatum
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
LEFT JOIN (
	SELECT MIN(VPrLogDostDatum) as DNas, VPrRefEAN
	FROM dbo.VTbLogDost
	WHERE VPrZmenaCo = 'true'
	GROUP BY VPrRefEAN
) AS t4
on t1.EAN = t4.VPrRefEAN
WHERE --isnull(VPrDodSklad,'') != 'Ryby' AND
RefSklad = 18 AND EAN IS NOT NULL AND RelSkTyp != 3

-- aktualizuj master produkt
UPDATE f
SET f.archive = isnull(e.minArchive,0)
FROM dbo.SKz d
LEFT JOIN (
SELECT IDS, MIN(cast(archive as int)) as minArchive
	FROM (
		SELECT a.ID, IDS, archive
		FROM dbo.SKz a
		INNER JOIN (
			SELECT ID, archive, isCluster
			FROM $DB_BS$.[dbo].[SKzEx]
		) b
		on a.ID = b.Id
		WHERE isCluster = 0
	) c
	GROUP BY IDS
) e
on d.IDs = e.ids

INNER JOIN (
	SELECT ID, isCluster, archive
	FROM $DB_BS$.[dbo].[SKzEx]
) f
on d.ID = f.Id
WHERE isCluster = 1

/*
SELECT
	t3.Id, IDS, t1.EAN, DatCreate, Nazev, StavZ, VPrDodPocet, VPrDodDatum, DVyp, CASE
  		WHEN VPrDodSklad = 'Ryby' THEN 0
		WHEN StavZ-objedp-rezer-Reklam <= 0 AND ISNULL(VPrDodPocet,0) <= 5 AND DVyp IS NOT NULL AND DATEDIFF(DAY,DVyp,GETDATE()) >= 0 THEN 1 -- archiv pro věci, které nejsou dostupné déle jak x dní
		WHEN StavZ-objedp-rezer-Reklam <= 0 AND ISNULL(VPrDodPocet,0) > 5 AND VPrDodDatum IS NOT NULL AND DATEDIFF(DAY,GETDATE(),ISNULL(VPrDodDatum,0)) > 4 THEN 1 --archiv pro věci které jsou skladem pouze u dodavatele a za více jak 4 dny
		WHEN StavZ-objedp-rezer-Reklam <= 0 AND ISNULL(VPrDodPocet,0) <= 5 AND DNas IS NULL THEN 1 --archiv pro věci které se ani jednou nenaskladnily
		WHEN StavZ-objedp-rezer-Reklam <= 0 AND ISNULL(VPrDodPocet,0) <= 5 AND DVyp IS NULL THEN 1 -- archiv pro věci, které jsou rezervované, ale ještě skladem. U těchto se nebere v potaz jak dlouho nejsou dostupné, protože ještě nemají DVyp
		ELSE 0
	END as IsArchive
FROM [bs_StwPh_28311159_2015].dbo.SKzEx AS t3
LEFT JOIN (
	SELECT ID, ids, EAN, RelSkTyp, DatCreate, RefSklad, Nazev, VPrDodSklad, StavZ, objedp, rezer, Reklam, VPrDodPocet, VPrGledis, VPrGledis2, VPrDodDatum
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
LEFT JOIN (
	SELECT MIN(VPrLogDostDatum) as DNas, VPrRefEAN
	FROM dbo.VTbLogDost
	WHERE VPrZmenaCo = 'true'
	GROUP BY VPrRefEAN
) AS t4
on t1.EAN = t4.VPrRefEAN
WHERE isnull(VPrDodSklad,'') != 'Ryby' AND RefSklad = 18 AND EAN IS NOT NULL and IDS = 'B32864' AND RelSkTyp != 3
ORDER BY IsArchive


-- slect/update pro master produkty
SELECT d.ID, d.IDS, EAN, minArchive, isCluster
FROM dbo.SKz d

LEFT JOIN (
SELECT IDS, MIN(cast(archive as int)) as minArchive
	FROM (
		SELECT a.ID, IDS, archive
		FROM dbo.SKz a
		INNER JOIN (
			SELECT ID, archive, isCluster
			FROM [bs_StwPh_28311159_2015].[dbo].[SKzEx]
		) b
		on a.ID = b.Id
		WHERE isCluster = 0
	) c
	GROUP BY IDS
) e
on d.IDS = e.ids

INNER JOIN (
	SELECT ID, isCluster
	FROM [bs_StwPh_28311159_2015].[dbo].[SKzEx]
) f
on d.ID = f.Id

where isCluster = 1
*/

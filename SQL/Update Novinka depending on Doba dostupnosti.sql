-- nastav novinka u všech velikostí artiklů kde main produkt má Doba dostupnosti <= 90
UPDATE dbo.SKZ SET Novinka = 0 WHERE Novinka = 0

UPDATE dbo.SKz
SET dbo.SKz.Novinka = 1
FROM dbo.SKz
INNER JOIN (
		SELECT IDS, MAX(VPrDobaDostupD) as MaxDoba
		FROM dbo.SKz
		GROUP BY IDS
		) groupedSKz
ON SKz.IDS = groupedSKz.IDS

WHERE MaxDoba <= 90
-SELECT IDS, SUM(CASE WHEN StavZ > 0 THEN 1 ELSE 0 END) as Skladem, COUNT(IDS) as Sizerun FROM dbo.SKz WHERE IDS = 'G17068' GROUP BY IDS

--SELECT IDS, (SUM(CASE WHEN StavZ > 0 THEN 1 ELSE 0 END)/CAST(COUNT(IDS) AS Decimal)) as PercentSizerun FROM dbo.SKz WHERE IDS = 'G17068' GROUP BY IDS

--SELECT ID, IDS, VPrDostSzrSklad FROM dbo.SKz WHERE IDS = 'G17068' AND RefSklad = 18

--SELECT IDS, (SUM(CASE WHEN StavZ > 0 THEN 1 ELSE 0 END)/CAST(COUNT(IDS)-1 AS Decimal)) as PercentSizerun FROM dbo.SKz WHERE refSklad = 18 AND IDS = 'G17068' GROUP BY IDS

--SELECT IDS, (SUM(CASE WHEN VPrDodPocet > 0 THEN 1 ELSE 0 END)/CAST(COUNT(IDS)-1 AS Decimal)) as PercentSizerunDod FROM dbo.SKz WHERE refSklad = 18 GROUP BY IDS

UPDATE dbo.SKz 
SET dbo.SKz.VPrDostSzrSklad = A.PercentSizerun
FROM dbo.SKz 
INNER JOIN
(SELECT IDS, (SUM(CASE WHEN StavZ > 0 THEN 1 ELSE 0 END)/nullif(CAST(COUNT(IDS)-1 AS Decimal),0)) as PercentSizerun FROM dbo.SKz WHERE refSklad = 18 GROUP BY IDS) 
AS A
ON dbo.SKz.IDS = A.IDS 
WHERE refSklad = 18

UPDATE dbo.SKz 
SET dbo.SKz.VPrDostSzrDod = A.PercentSizerun
FROM dbo.SKz 
INNER JOIN
(SELECT IDS, (SUM(CASE WHEN VPrDodPocet > 5 THEN 1 ELSE 0 END)/nullif(CAST(COUNT(IDS)-1 AS Decimal),0)) as PercentSizerun FROM dbo.SKz WHERE refSklad = 18 GROUP BY IDS) 
AS A
ON dbo.SKz.IDS = A.IDS 
WHERE refSklad = 18
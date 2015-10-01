SELECT a.ID, a.IDS, A.EAN, nazev, StavZ-isnull(objedp,0)-isnull(rezer,0)-isnull(Reklam,0) as zasoba, RefSklad, VPrDodPocet, VPrDodDatum, archive
FROM [bs_StwPh_28311159_2015].[dbo].[SKzEx] b
INNER JOIN [StwPh_28311159_2015].[dbo].[SKz] a
ON b.ID = a.ID
where IDS = 's17957'

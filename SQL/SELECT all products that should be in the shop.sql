SELECT a.ID, a.IDS, A.EAN, nazev, StavZ-isnull(objedp,0)-isnull(rezer,0)-isnull(Reklam,0) as zasoba, RefSklad, VPrDodPocet, VPrDodDatum, archive, RefVPrFoto
FROM [bs_StwPh_28311159_2015].[dbo].[SKzEx] b
INNER JOIN [StwPh_28311159_2015].[dbo].[SKz] a
ON b.ID = a.ID
where
	((StavZ-isnull(objedp,0)-isnull(rezer,0)-isnull(Reklam,0) > 0)
	OR
	(VPrDodPocet > 5 AND DATEDIFF(DAY,GETDATE(),VPrDodDatum) < 5))
	and RefSklad = 18 --je v našem skladu "sklad"
	and archive = 0 -- není v archivu
	and IObchod = 1 -- má zaškrtnutý příznak "eshop"
	--and Nazev not like '%poukaz%'
	--and (VPrGledis = 1 or VPrGledis2 = 1)
	and RefVPrFoto <> 223 -- má fotku
	--and IDS = '103049-01'

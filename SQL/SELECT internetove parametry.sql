-- select sezonu (ValText)

-- RefParam 6 = sezona
-- RefParam 32 = Velikost-F
-- RefParam 33 = Velikost-F-EUR
-- RefParam 34 = Velikost-F-US
-- RefParam 35 = Velikost-F-UK


SELECT a.IDS, EAN, Nazev, VPrNovinka, printorder, d.ids as 'Velikost-F', e.IDS as 'Velikost-F-EUR', f.IDS as 'Velikost-F-US', g.IDS as 'Velikost-F-UK', VPrVelikostW, VPrVelikostEurW, VPrVelikostUkW, VPrVelikostUsW
FROM dbo.SKz as a

INNER JOIN  [bs_StwPh_28311159_2015].dbo.SKzEx b
ON a.ID = b.ID

-- vyber z tabulky spojujici produkt ID, internetovy parametr a hodnotu internetoveho parametru
LEFT JOIN (
	SELECT ID, RefAG, RefParam, RefParamList
	FROM dbo.SkRefParamList
	WHERE RefParam = 32
) as c
ON a.ID = c.RefAg

-- najdi text k internetovemu parametru
LEFT JOIN (
	SELECT ID, RefAG, IDS
	FROM dbo.SkParamList
	WHERE RefAG = 32
) as d
ON c.RefParamList = d.ID

LEFT JOIN (
	SELECT ID, RefAG, IDS
	FROM dbo.SkParamList
	WHERE RefAG = 33
) as e
ON c.RefParamList = e.ID

LEFT JOIN (
	SELECT ID, RefAG, IDS
	FROM dbo.SkParamList
	WHERE RefAG = 34
) as f
ON c.RefParamList = f.ID

LEFT JOIN (
	SELECT ID, RefAG, IDS
	FROM dbo.SkParamList
	WHERE RefAG = 35
) as g
ON c.RefParamList = g.ID

WHERE RefSklad = 18 and
 a.ids = 'D89709'

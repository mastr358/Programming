/*
Tento skript zaznamenává změny dostupnosti (u nás i dodavatele) do uživatelské agendy VTbLogDost.
Skript může být spuštěn v libovolném množství během dne, vždy se zaznamenají pouze změny dostupnosti.
Ony by se zaznamenaly druhý den tak jako tak, takže jsme omezení pouze výpočetním časem serveru.
*/

-- insert values into VTbLogDost
INSERT INTO dbo.VTbLogDost (
	Sel, 
	UsrOrder, 
	RelCR, 
	Cislo, 
	Pozn, 
	Oznacil, 
	Ucetni, 
	Creator, 
	VPrLogDostDatum, 
	VPrRefEAN, 
	VPrZmenaKde, 
	VPrZmenaCo
) 
SELECT 
	'false',
	null, 
	null, 
	null, 
	null, 
	null, 
	'@', 
	'@', 
	GETDATE(),  
	EAN, 
	'false', 
	CAST(
		CASE
			WHEN isnull(StavZ,0) = 0
				THEN 0
			ELSE 1
		END as BIT
	)
FROM dbo.SKz
WHERE 
	isnull(StavZ,0) != isnull(VPrStavZVcera,0) 
  AND (isnull(StavZ,0) = 0 OR isnull(VPrStavZVcera,0) = 0)
  AND RefSklad = 18
  
INSERT INTO dbo.VTbLogDost (
	Sel, 
	UsrOrder, 
	RelCR, 
	Cislo, 
	Pozn, 
	Oznacil, 
	Ucetni, 
	Creator, 
	VPrLogDostDatum, 
	VPrRefEAN, 
	VPrZmenaKde, 
	VPrZmenaCo
) 
SELECT 
	'false',
	null, 
	null, 
	null, 
	null, 
	null, 
	'@', 
	'@', 
	GETDATE(),  
	EAN, 
	'true', 
	CAST(
		CASE
			WHEN isnull(VPrDodPocet,0) < 5
				THEN 0
			ELSE 1
		END as BIT
	)
FROM dbo.SKz
WHERE 
		(isnull(VPrDodPocet,0) < 5 AND isnull(VPrDodPocetVcera,0) >= 5) 
		OR 
    (isnull(VPrDodPocetVcera,0) < 5 AND isnull(VPrDodPocet,0) >= 5)
    AND RefSklad = 18
    
-- record stock for next comparison tomorrow
UPDATE dbo.SKz SET VPrStavZVcera = StavZ, VPrDodPocetVcera = VPrDodPocet
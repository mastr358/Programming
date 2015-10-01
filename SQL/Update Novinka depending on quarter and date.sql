-- -- nebylo dokončeno, změnilo se zadání

--UPDATE dbo.SKz
--SET dbo.SKz.Novinka = 
--(CASE 
--	-- if year now (2015) equals year from int. param. (15Q1)
--	WHEN RIGHT(YEAR(GETDATE()),2) = LEFT(ValText,2) AND
--		 RIGHT(ValText,1) >= DATEPART(Q,GETDATE())
--	THEN 1
--	ELSE 0
--END)
--FROM dbo.SKz
--INNER JOIN dbo.SkRefParam
--	ON dbo.SKz.ID = dbo.SkRefParam.RefAg
	
---- update only for rows where their ValText contains "Q" - this limits number of processed rows.
--WHERE CHARINDEX('Q',SkRefParam.ValText) > 0 AND SKz.Vyrobce IN ('adidas', 'Reebok', 'Puma')

-- do update for items of other manufacturers with attribute dependant on first date available
UPDATE dbo.SKz
SET dbo.SKz.Novinka = 
(CASE 
	-- if year now (2015) equals year from int. param. (15Q1)
	WHEN RIGHT(YEAR(GETDATE()),2) = LEFT(ValText,2) AND
		 RIGHT(ValText,1) >= DATEPART(Q,GETDATE())
	THEN 1
	ELSE 0
END)
FROM dbo.SKz
INNER JOIN dbo.SkRefParam
	ON dbo.SKz.ID = dbo.SkRefParam.RefAg
	
-- update only for rows where their ValText contains "Q" - this limits number of processed rows.
WHERE SKz.Vyrobce NOT IN ('adidas', 'Reebok', 'Puma')
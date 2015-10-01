-- select products that have value 14Q3 in internet parameter
SELECT Skz.ID, SKz.IDS 
FROM dbo.SKz
INNER JOIN dbo.SkRefParam
ON dbo.SKz.ID=dbo.SkRefParam.RefAg
WHERE ValText = '14Q3'
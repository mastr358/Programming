-- ringit 1
-- a-mania 2
-- a-mania + ringit 3
-- a-mania + ringit + total-store 7
-- total-store 4
-- total-store + ringit 5
-- total-store + a-mania 6
-- total-store + style-puma 12
-- total-store + rb-store 20
-- style-puma 8
-- style-puma + ringit 9
-- style-puma + ringit + total-store 13
-- rb-store 16
-- rb-store + ringit 17
-- rb-store + ringit + total-store 21
-- zlaty-kapr 32

if OBJECT_ID('tempdb..#TempTable') is null CREATE TABLE #TempTable (IDS varchar(64), eshop_visibility int)

delete from #TempTable
BULK INSERT #TempTable
    FROM '\\SDell\PohodaSQL\BHIT\eshopAssignment.csv'
    WITH
    (
	FORMATFILE = '\\SDell\PohodaSQL\BHIT\csvFormat.fmt'
    )

UPDATE b
set b.eshop_visibility = c.eshop_visibility
FROM [bs_StwPh_28311159_2015].[dbo].[SKzEx] b
INNER JOIN [StwPh_28311159_2015].[dbo].[SKz] a
ON b.ID = a.ID
INNER JOIN
#TempTable c on a.IDS = c.IDS

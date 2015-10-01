/*
Create table dbo.CsvImportTest
(ID int, IDS varchar(40), eshop_visibility int)
*/

--CREATE TABLE #TempTable (IDS varchar(64), eshop_visibility int)

delete from #TempTable
update dbo.SKz set StavZ = 0 where IDS in ('008234','008299','008348','008388','008391')
BULK INSERT #TempTable
    FROM 'C:\Users\Administrator\Desktop\Martin_Induo\csvtest-smazat.csv'
    WITH
    (
	FORMATFILE = 'C:\Users\Administrator\Desktop\Martin_Induo\csvFormat.fmt',
	ERRORFILE = 'C:\Users\Administrator\Desktop\Martin_Induo\csvtest-log.log'
    )

Update dbo.SKz
set SKz.StavZ = #TempTable.eshop_visibility
FROM SKz
Inner join #TempTable on SKz.IDS = #TempTable.IDS

select * from #TempTable
select IDS, StavZ from dbo.SKz where IDS in ('008234','008299','008348','008388','008391')

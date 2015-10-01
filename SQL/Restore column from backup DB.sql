UPDATE Orig
SET Orig.RefStr =BackupDB.RefStr
FROM [StwPh_28311159_2014].[dbo].[OBJ] Orig
INNER JOIN [StwPh_28311159_2014_obnova].[dbo].[OBJ] BackupDB
	ON Orig.ID = BackupDB.ID
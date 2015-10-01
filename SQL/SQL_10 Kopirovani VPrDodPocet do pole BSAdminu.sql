UPDATE BSdb
SET BSdb.external_store = ISNULL(db.VPrDodPocet,0)
FROM $DB_BS$.[dbo].[SKzEx] BSdb
INNER JOIN [dbo].[SKz] db
	ON BSdb.ID = db.ID
WHERE (db.VPrDodSklad != 'Ryby' OR db.VPrDodSklad IS NULL)
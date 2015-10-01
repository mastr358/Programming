SELECT foo.IDS, FOO.EAN, bar.archive
FROM [StwPh_28311159_2015].[dbo].[SKz] foo
INNER JOIN (
	SELECT Id, archive
	FROM [bs_StwPh_28311159_2015].[dbo].[SKzEx]
) bar
ON foo.ID = bar.Id
WHERE foo.RefSklad = 18 AND foo.EAN IS not NULL
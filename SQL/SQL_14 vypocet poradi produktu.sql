-- calculate points for variants

-- create temp table for score of individual sizes
if OBJECT_ID('tempdb..#TempBodySklad') is null CREATE TABLE #TempBodySklad (pohlavi varchar(64), sekce varchar(64), velikost varchar(64), body int)
else delete from #TempBodySklad;

insert into #TempBodySklad (pohlavi, sekce, velikost, body) values
('Muži','Boty','3,5','0'),
('Muži','Boty','4','0'),
('Muži','Boty','4,5','0'),
('Muži','Boty','5','0'),
('Muži','Boty','5,5','0'),
('Muži','Boty','6','0'),
('Muži','Boty','6,5','0'),
('Muži','Boty','7','1'),
('Muži','Boty','7,5','2'),
('Muži','Boty','8','4'),
('Muži','Boty','8,5','4'),
('Muži','Boty','9','6'),
('Muži','Boty','9,5','4'),
('Muži','Boty','10','4'),
('Muži','Boty','10,5','2'),
('Muži','Boty','11','1'),
('Muži','Boty','11,5','1'),
('Muži','Boty','12','1'),
('Muži','Boty','12,5','0'),
('Muži','Boty','13','0'),
('Děti','Boty','3K','2'),
('Děti','Boty','3,5K','2'),
('Děti','Boty','4K','2'),
('Děti','Boty','4,5K','2'),
('Děti','Boty','5K','2'),
('Děti','Boty','5,5K','2'),
('Děti','Boty','6K','2'),
('Děti','Boty','7K','2'),
('Děti','Boty','8K','2'),
('Děti','Boty','8,5K','2'),
('Děti','Boty','9K','2'),
('Děti','Boty','9,5K','2'),
('Děti','Boty','10K','2'),
('Děti','Boty','10,5K','2'),
('Děti','Boty','11K','2'),
('Děti','Boty','11,5k','2'),
('Děti','Boty','12K','2'),
('Děti','Boty','12,5K','2'),
('Děti','Boty','13k','2'),
('Děti','Boty','13,5K','2'),
('Ženy','Boty','3,5','1'),
('Ženy','Boty','4','1'),
('Ženy','Boty','4,5','2'),
('Ženy','Boty','5','4'),
('Ženy','Boty','5,5','4'),
('Ženy','Boty','6','4'),
('Ženy','Boty','6,5','4'),
('Ženy','Boty','7','4'),
('Ženy','Boty','7,5','2'),
('Ženy','Boty','8','1'),
('Ženy','Boty','8,5','1'),
('Ženy','Boty','9','1'),
('Ženy','Boty','9,5','0'),
('Ženy','Boty','10','0'),
('Ženy','Boty','10,5','0'),
('Ženy','Boty','11','0'),
('Ženy','Boty','11,5','0'),
('Ženy','Boty','12','0'),
('Ženy','Boty','12,5','0'),
('Ženy','Boty','13','0'),
('Ženy','Oblečení','XS','3'),
('Ženy','Oblečení','S','6'),
('Ženy','Oblečení','M','8'),
('Ženy','Oblečení','L','4'),
('Ženy','Oblečení','XL','4'),
('Ženy','Oblečení','XXL','1'),
('Muži','Oblečení','XS','1'),
('Muži','Oblečení','S','2'),
('Muži','Oblečení','M','6'),
('Muži','Oblečení','L','8'),
('Muži','Oblečení','XL','6'),
('Muži','Oblečení','XXL','3'),
('Unisex','Boty','3,5','0'),
('Unisex','Boty','4','1'),
('Unisex','Boty','4,5','1'),
('Unisex','Boty','5','1'),
('Unisex','Boty','5,5','2'),
('Unisex','Boty','6','2'),
('Unisex','Boty','6,5','3'),
('Unisex','Boty','7','3'),
('Unisex','Boty','7,5','4'),
('Unisex','Boty','8','3'),
('Unisex','Boty','8,5','3'),
('Unisex','Boty','9','2'),
('Unisex','Boty','9,5','2'),
('Unisex','Boty','10','1'),
('Unisex','Boty','10,5','1'),
('Unisex','Boty','11','1'),
('Unisex','Boty','11,5','0'),
('Unisex','Boty','12','0'),
('Unisex','Boty','12,5','0'),
('Unisex','Boty','13','0'),
('Unisex','Oblečení','XS','1'),
('Unisex','Oblečení','S','3'),
('Unisex','Oblečení','M','6'),
('Unisex','Oblečení','L','6'),
('Unisex','Oblečení','XL','3'),
('Unisex','Oblečení','XXL','1')

-- create temp table for score of indiviual sizes of the supplier stock
if OBJECT_ID('tempdb..#TempBodyDod2') is null CREATE TABLE #TempBodyDod2 (pohlavi varchar(64), sekce varchar(64), velikost varchar(64), body int)
else delete from #TempBodyDod2;

insert into #TempBodyDod2 (pohlavi, sekce, velikost, body) values
('Muži','Boty','3,5','0'),
('Muži','Boty','4','0'),
('Muži','Boty','4,5','0'),
('Muži','Boty','5','0'),
('Muži','Boty','5,5','0'),
('Muži','Boty','6','0'),
('Muži','Boty','6,5','0'),
('Muži','Boty','7','1'),
('Muži','Boty','7,5','2'),
('Muži','Boty','8','4'),
('Muži','Boty','8,5','4'),
('Muži','Boty','9','6'),
('Muži','Boty','9,5','4'),
('Muži','Boty','10','4'),
('Muži','Boty','10,5','2'),
('Muži','Boty','11','1'),
('Muži','Boty','11,5','1'),
('Muži','Boty','12','1'),
('Muži','Boty','12,5','0'),
('Muži','Boty','13','0'),
('Děti','Boty','3K','2'),
('Děti','Boty','3,5K','2'),
('Děti','Boty','4K','2'),
('Děti','Boty','4,5K','2'),
('Děti','Boty','5K','2'),
('Děti','Boty','5,5K','2'),
('Děti','Boty','6K','2'),
('Děti','Boty','7K','2'),
('Děti','Boty','8K','2'),
('Děti','Boty','8,5K','2'),
('Děti','Boty','9K','2'),
('Děti','Boty','9,5K','2'),
('Děti','Boty','10K','2'),
('Děti','Boty','10,5K','2'),
('Děti','Boty','11K','2'),
('Děti','Boty','11,5k','2'),
('Děti','Boty','12K','2'),
('Děti','Boty','12,5K','2'),
('Děti','Boty','13k','2'),
('Děti','Boty','13,5K','2'),
('Ženy','Boty','3,5','1'),
('Ženy','Boty','4','1'),
('Ženy','Boty','4,5','2'),
('Ženy','Boty','5','4'),
('Ženy','Boty','5,5','4'),
('Ženy','Boty','6','4'),
('Ženy','Boty','6,5','4'),
('Ženy','Boty','7','4'),
('Ženy','Boty','7,5','2'),
('Ženy','Boty','8','1'),
('Ženy','Boty','8,5','1'),
('Ženy','Boty','9','1'),
('Ženy','Boty','9,5','0'),
('Ženy','Boty','10','0'),
('Ženy','Boty','10,5','0'),
('Ženy','Boty','11','0'),
('Ženy','Boty','11,5','0'),
('Ženy','Boty','12','0'),
('Ženy','Boty','12,5','0'),
('Ženy','Boty','13','0'),
('Ženy','Oblečení','XS','3'),
('Ženy','Oblečení','S','6'),
('Ženy','Oblečení','M','8'),
('Ženy','Oblečení','L','4'),
('Ženy','Oblečení','XL','4'),
('Ženy','Oblečení','XXL','1'),
('Muži','Oblečení','XS','1'),
('Muži','Oblečení','S','2'),
('Muži','Oblečení','M','6'),
('Muži','Oblečení','L','8'),
('Muži','Oblečení','XL','6'),
('Muži','Oblečení','XXL','3'),
('Unisex','Boty','3,5','0'),
('Unisex','Boty','4','1'),
('Unisex','Boty','4,5','1'),
('Unisex','Boty','5','1'),
('Unisex','Boty','5,5','2'),
('Unisex','Boty','6','2'),
('Unisex','Boty','6,5','3'),
('Unisex','Boty','7','3'),
('Unisex','Boty','7,5','4'),
('Unisex','Boty','8','3'),
('Unisex','Boty','8,5','3'),
('Unisex','Boty','9','2'),
('Unisex','Boty','9,5','2'),
('Unisex','Boty','10','1'),
('Unisex','Boty','10,5','1'),
('Unisex','Boty','11','1'),
('Unisex','Boty','11,5','0'),
('Unisex','Boty','12','0'),
('Unisex','Boty','12,5','0'),
('Unisex','Boty','13','0'),
('Unisex','Oblečení','XS','1'),
('Unisex','Oblečení','S','3'),
('Unisex','Oblečení','M','6'),
('Unisex','Oblečení','L','6'),
('Unisex','Oblečení','XL','3'),
('Unisex','Oblečení','XXL','1')

-- calculate points for sizes on stock for variants
UPDATE b
	SET printorder = ISNULL(
							-- for 'Boty' search for size in Velikost-F-UK
							case when (VPrSekce = 'Boty') then
								-- points for size on our stock
								case when (StavZ-isnull(objedp,0)-isnull(rezer,0)-isnull(Reklam,0) > 0)
										then (select body from #TempBodySklad where pohlavi = a.vprPohlavi and sekce = VPrSekce and velikost = f.IDS)
										else 0 end +
								-- points for size on supplier stock
								case when (VPrDodPocet > 5 and DATEDIFF(DAY,VPrDodDatum,GETDATE()) < 5)
										then (select body from #TempBodyDod2 where pohlavi = a.vprPohlavi and sekce = VPrSekce and velikost = f.IDS )
										else 0 end

							-- for other products, search for size in Velikost-F
							else
								-- points for size on our stock
								case when (StavZ-isnull(objedp,0)-isnull(rezer,0)-isnull(Reklam,0) > 0)
										then (select body from #TempBodySklad where pohlavi = a.vprPohlavi and sekce = VPrSekce and velikost = d.IDS )
										else 0 end +
								-- points for size on supplier stock
								case when (VPrDodPocet > 5 and DATEDIFF(DAY,VPrDodDatum,GETDATE()) < 5)
										then (select body from #TempBodyDod2 where pohlavi = a.vprPohlavi and sekce = VPrSekce and velikost = d.IDS)
										else 0 end

							end
						,0)

	FROM [bs_StwPh_28311159_2015].[dbo].[SKzEx] b

	INNER JOIN [StwPh_28311159_2015].[dbo].[SKz] a
	ON b.ID = a.ID

	LEFT JOIN (
		SELECT ID, RefAG, RefParam, RefParamList
		FROM dbo.SkRefParamList
		WHERE RefParam = 32
	) as c
	ON a.ID = c.RefAg

	LEFT JOIN (
		SELECT ID, RefAG, IDS
		FROM dbo.SkParamList
		WHERE RefAG = 32
	) as d
	ON c.RefParamList = d.ID

	LEFT JOIN (
		SELECT ID, RefAG, RefParam, RefParamList
		FROM dbo.SkRefParamList
		WHERE RefParam = 35
	) as e
	ON a.ID = e.RefAg

	LEFT JOIN (
		SELECT ID, RefAG, IDS
		FROM dbo.SkParamList
		WHERE RefAG = 35
	) as f
	ON e.RefParamList = f.ID

	WHERE a.IDS = 'Z18823' and isCluster = 0

-- calculate points for master
UPDATE b
SET printorder = ISNULL(
							(
							-- if it's Boty
							CASE WHEN (a.VPrSekce = 'Boty') THEN
							(
								-- sum the score
								SELECT SUM(m.score)
								FROM
								(
									-- of the unique printorder values
									SELECT distinct f.ids, min(x.ids) as myIDS, max(printorder) as score
									FROM [bs_StwPh_28311159_2015].[dbo].[SKzEx] y
									INNER JOIN [StwPh_28311159_2015].[dbo].[SKz] x
									ON y.ID = x.ID
										LEFT JOIN (
											SELECT ID, RefAG, RefParam, RefParamList
											FROM dbo.SkRefParamList
											WHERE RefParam = 35
										) as e
										ON x.ID = e.RefAg

										LEFT JOIN (
											SELECT ID, RefAG, IDS
											FROM dbo.SkParamList
											WHERE RefAG = 35
										) as f
										ON e.RefParamList = f.ID
										-- for that product's variants
										WHERE x.ids = a.ids AND y.isCluster = 0
										group by f.ids
								) m
							)
							-- if it's not Boty
							ELSE
							(
								-- sum the score
								SELECT SUM(m.score)
								FROM
								(
									-- of the unique (by Velikost-F-UK) printorders
									SELECT distinct f.ids, min(x.ids) as myIDS, max(printorder) as score
									FROM [bs_StwPh_28311159_2015].[dbo].[SKzEx] y
									INNER JOIN [StwPh_28311159_2015].[dbo].[SKz] x
									ON y.ID = x.ID
										LEFT JOIN (
											SELECT ID, RefAG, RefParam, RefParamList
											FROM dbo.SkRefParamList
											WHERE RefParam = 32
										) as e
										ON x.ID = e.RefAg

										LEFT JOIN (
											SELECT ID, RefAG, IDS
											FROM dbo.SkParamList
											WHERE RefAG = 32
										) as f
										ON e.RefParamList = f.ID
										-- for that product's variants
										WHERE x.ids = a.ids AND y.isCluster = 0
										group by f.ids
								) m
							)
							END

						),0
						)
						-- and add points for other parameters
						+ case when (VPrNovinka = 1) then 10 else 0 end
						+ VPrPriorita

FROM [bs_StwPh_28311159_2015].[dbo].[SKzEx] b
INNER JOIN [StwPh_28311159_2015].[dbo].[SKz] a
ON b.ID = a.ID

where IDS = 'Z18823' and b.isCluster = 1




/*
-- calculate points for variants

-- create temp table for score of individual sizes
if OBJECT_ID('tempdb..#TempBodySklad') is null CREATE TABLE #TempBodySklad (pohlavi varchar(64), sekce varchar(64), velikost varchar(64), body int)
else delete from #TempBodySklad;

insert into #TempBodySklad (pohlavi, sekce, velikost, body) values
('Muži','Boty','3,5','0'),
('Muži','Boty','4','0'),
('Muži','Boty','4,5','0'),
('Muži','Boty','5','0'),
('Muži','Boty','5,5','0'),
('Muži','Boty','6','0'),
('Muži','Boty','6,5','0'),
('Muži','Boty','7','1'),
('Muži','Boty','7,5','2'),
('Muži','Boty','8','4'),
('Muži','Boty','8,5','4'),
('Muži','Boty','9','6'),
('Muži','Boty','9,5','4'),
('Muži','Boty','10','4'),
('Muži','Boty','10,5','2'),
('Muži','Boty','11','1'),
('Muži','Boty','11,5','1'),
('Muži','Boty','12','1'),
('Muži','Boty','12,5','0'),
('Muži','Boty','13','0'),
('Děti','Boty','3K','2'),
('Děti','Boty','3,5K','2'),
('Děti','Boty','4K','2'),
('Děti','Boty','4,5K','2'),
('Děti','Boty','5K','2'),
('Děti','Boty','5,5K','2'),
('Děti','Boty','6K','2'),
('Děti','Boty','7K','2'),
('Děti','Boty','8K','2'),
('Děti','Boty','8,5K','2'),
('Děti','Boty','9K','2'),
('Děti','Boty','9,5K','2'),
('Děti','Boty','10K','2'),
('Děti','Boty','10,5K','2'),
('Děti','Boty','11K','2'),
('Děti','Boty','11,5k','2'),
('Děti','Boty','12K','2'),
('Děti','Boty','12,5K','2'),
('Děti','Boty','13k','2'),
('Děti','Boty','13,5K','2'),
('Ženy','Boty','3,5','1'),
('Ženy','Boty','4','1'),
('Ženy','Boty','4,5','2'),
('Ženy','Boty','5','4'),
('Ženy','Boty','5,5','4'),
('Ženy','Boty','6','4'),
('Ženy','Boty','6,5','4'),
('Ženy','Boty','7','4'),
('Ženy','Boty','7,5','2'),
('Ženy','Boty','8','1'),
('Ženy','Boty','8,5','1'),
('Ženy','Boty','9','1'),
('Ženy','Boty','9,5','0'),
('Ženy','Boty','10','0'),
('Ženy','Boty','10,5','0'),
('Ženy','Boty','11','0'),
('Ženy','Boty','11,5','0'),
('Ženy','Boty','12','0'),
('Ženy','Boty','12,5','0'),
('Ženy','Boty','13','0'),
('Ženy','Oblečení','XS','3'),
('Ženy','Oblečení','S','6'),
('Ženy','Oblečení','M','8'),
('Ženy','Oblečení','L','4'),
('Ženy','Oblečení','XL','4'),
('Ženy','Oblečení','XXL','1'),
('Ženy','Oblečení','2XL','1'),
('Muži','Oblečení','XS','1'),
('Muži','Oblečení','S','2'),
('Muži','Oblečení','M','6'),
('Muži','Oblečení','L','8'),
('Muži','Oblečení','XL','6'),
('Muži','Oblečení','XXL','3'),
('Muži','Oblečení','2XL','3'),
('Unisex','Boty','3,5','0'),
('Unisex','Boty','4','1'),
('Unisex','Boty','4,5','1'),
('Unisex','Boty','5','1'),
('Unisex','Boty','5,5','2'),
('Unisex','Boty','6','2'),
('Unisex','Boty','6,5','3'),
('Unisex','Boty','7','3'),
('Unisex','Boty','7,5','4'),
('Unisex','Boty','8','3'),
('Unisex','Boty','8,5','3'),
('Unisex','Boty','9','2'),
('Unisex','Boty','9,5','2'),
('Unisex','Boty','10','1'),
('Unisex','Boty','10,5','1'),
('Unisex','Boty','11','1'),
('Unisex','Boty','11,5','0'),
('Unisex','Boty','12','0'),
('Unisex','Boty','12,5','0'),
('Unisex','Boty','13','0'),
('Unisex','Oblečení','XS','1'),
('Unisex','Oblečení','S','3'),
('Unisex','Oblečení','M','6'),
('Unisex','Oblečení','L','6'),
('Unisex','Oblečení','XL','3'),
('Unisex','Oblečení','XXL','1'),
('Unisex','Oblečení','2XL','1')

-- create temp table for score of indiviual sizes of the supplier stock
if OBJECT_ID('tempdb..#TempBodyDod2') is null CREATE TABLE #TempBodyDod2 (pohlavi varchar(64), sekce varchar(64), velikost varchar(64), body int)
else delete from #TempBodyDod2;

insert into #TempBodyDod2 (pohlavi, sekce, velikost, body) values
('Muži','Boty','3,5','0'),
('Muži','Boty','4','0'),
('Muži','Boty','4,5','0'),
('Muži','Boty','5','0'),
('Muži','Boty','5,5','0'),
('Muži','Boty','6','0'),
('Muži','Boty','6,5','0'),
('Muži','Boty','7','1'),
('Muži','Boty','7,5','2'),
('Muži','Boty','8','4'),
('Muži','Boty','8,5','4'),
('Muži','Boty','9','6'),
('Muži','Boty','9,5','4'),
('Muži','Boty','10','4'),
('Muži','Boty','10,5','2'),
('Muži','Boty','11','1'),
('Muži','Boty','11,5','1'),
('Muži','Boty','12','1'),
('Muži','Boty','12,5','0'),
('Muži','Boty','13','0'),
('Děti','Boty','3K','2'),
('Děti','Boty','3,5K','2'),
('Děti','Boty','4K','2'),
('Děti','Boty','4,5K','2'),
('Děti','Boty','5K','2'),
('Děti','Boty','5,5K','2'),
('Děti','Boty','6K','2'),
('Děti','Boty','7K','2'),
('Děti','Boty','8K','2'),
('Děti','Boty','8,5K','2'),
('Děti','Boty','9K','2'),
('Děti','Boty','9,5K','2'),
('Děti','Boty','10K','2'),
('Děti','Boty','10,5K','2'),
('Děti','Boty','11K','2'),
('Děti','Boty','11,5k','2'),
('Děti','Boty','12K','2'),
('Děti','Boty','12,5K','2'),
('Děti','Boty','13k','2'),
('Děti','Boty','13,5K','2'),
('Ženy','Boty','3,5','1'),
('Ženy','Boty','4','1'),
('Ženy','Boty','4,5','2'),
('Ženy','Boty','5','4'),
('Ženy','Boty','5,5','4'),
('Ženy','Boty','6','4'),
('Ženy','Boty','6,5','4'),
('Ženy','Boty','7','4'),
('Ženy','Boty','7,5','2'),
('Ženy','Boty','8','1'),
('Ženy','Boty','8,5','1'),
('Ženy','Boty','9','1'),
('Ženy','Boty','9,5','0'),
('Ženy','Boty','10','0'),
('Ženy','Boty','10,5','0'),
('Ženy','Boty','11','0'),
('Ženy','Boty','11,5','0'),
('Ženy','Boty','12','0'),
('Ženy','Boty','12,5','0'),
('Ženy','Boty','13','0'),
('Ženy','Oblečení','XS','3'),
('Ženy','Oblečení','S','6'),
('Ženy','Oblečení','M','8'),
('Ženy','Oblečení','L','4'),
('Ženy','Oblečení','XL','4'),
('Ženy','Oblečení','XXL','1'),
('Ženy','Oblečení','2XL','1'),
('Muži','Oblečení','XS','1'),
('Muži','Oblečení','S','2'),
('Muži','Oblečení','M','6'),
('Muži','Oblečení','L','8'),
('Muži','Oblečení','XL','6'),
('Muži','Oblečení','XXL','3'),
('Muži','Oblečení','2XL','3'),
('Unisex','Boty','3,5','0'),
('Unisex','Boty','4','1'),
('Unisex','Boty','4,5','1'),
('Unisex','Boty','5','1'),
('Unisex','Boty','5,5','2'),
('Unisex','Boty','6','2'),
('Unisex','Boty','6,5','3'),
('Unisex','Boty','7','3'),
('Unisex','Boty','7,5','4'),
('Unisex','Boty','8','3'),
('Unisex','Boty','8,5','3'),
('Unisex','Boty','9','2'),
('Unisex','Boty','9,5','2'),
('Unisex','Boty','10','1'),
('Unisex','Boty','10,5','1'),
('Unisex','Boty','11','1'),
('Unisex','Boty','11,5','0'),
('Unisex','Boty','12','0'),
('Unisex','Boty','12,5','0'),
('Unisex','Boty','13','0'),
('Unisex','Oblečení','XS','1'),
('Unisex','Oblečení','S','3'),
('Unisex','Oblečení','M','6'),
('Unisex','Oblečení','L','6'),
('Unisex','Oblečení','XL','3'),
('Unisex','Oblečení','2XL','1'),
('Unisex','Oblečení','XXL','1')

-- calculate points for sizes on stock for variants
SELECT nazev, a.vprpohlavi, a.VPrSekce, a.stavz, a.VPrPriorita, a.VPrNovinka, a.VPrDodPocet, a.VPrDodDatum, a.VPrVelikostUkW, a.VPrVelikostEurW, f.ids, d.ids, printorder = ISNULL(
							-- for 'Boty' search for size in Velikost-F-UK
							case when (VPrSekce = 'Boty') then
								-- points for size on our stock
								case when (StavZ-isnull(objedp,0)-isnull(rezer,0)-isnull(Reklam,0) > 0)
										then (select body from #TempBodySklad where pohlavi = a.vprPohlavi and sekce = VPrSekce and velikost = f.IDS)
										else 0 end +
								-- points for size on supplier stock
								case when (VPrDodPocet > 5 and DATEDIFF(DAY,VPrDodDatum,GETDATE()) < 5)
										then (select body from #TempBodyDod2 where pohlavi = a.vprPohlavi and sekce = VPrSekce and velikost = f.IDS )
										else 0 end

							-- for other products, search for size in Velikost-F
							else
								-- points for size on our stock
								case when (StavZ-isnull(objedp,0)-isnull(rezer,0)-isnull(Reklam,0) > 0)
										then (select body from #TempBodySklad where pohlavi = a.vprPohlavi and sekce = VPrSekce and velikost = d.IDS )
										else 0 end +
								-- points for size on supplier stock
								case when (VPrDodPocet > 5 and DATEDIFF(DAY,VPrDodDatum,GETDATE()) < 5)
										then (select body from #TempBodyDod2 where pohlavi = a.vprPohlavi and sekce = VPrSekce and velikost = d.IDS)
										else 0 end

							end
						,0)

	FROM [bs_StwPh_28311159_2015].[dbo].[SKzEx] b

	INNER JOIN [StwPh_28311159_2015].[dbo].[SKz] a
	ON b.ID = a.ID

	-- add table connecting product with specific (32=Velikost-W) parameter value ID
	LEFT JOIN (
		SELECT ID, RefAG, RefParam, RefParamList
		FROM dbo.SkRefParamList
		WHERE RefParam = 32
	) as c
	ON a.ID = c.RefAg

	-- add table connecting parameter value ID to specific value (e.g. "XS")
	LEFT JOIN (
		SELECT ID, RefAG, IDS
		FROM dbo.SkParamList
		WHERE RefAG = 32
	) as d
	ON c.RefParamList = d.ID

	-- add table connecting product with specific (35=Velikost-W-UK) parameter value ID
	LEFT JOIN (
		SELECT ID, RefAG, RefParam, RefParamList
		FROM dbo.SkRefParamList
		WHERE RefParam = 35
	) as e
	ON a.ID = e.RefAg

	-- add table connecting parameter value ID to specific value (e.g. "10,5")
	LEFT JOIN (
		SELECT ID, RefAG, IDS
		FROM dbo.SkParamList
		WHERE RefAG = 35
	) as f
	ON e.RefParamList = f.ID

	-- do it only for variants
	WHERE a.IDS = 'S17606' and isCluster = 0


-- calculate points for master
-- calculate printorder
SELECT printorder = 	(
							-- if it's Boty
							CASE WHEN (a.VPrSekce = 'Boty') THEN
							(
								-- sum the score
								SELECT SUM(m.score)
								FROM
								(
									-- of the unique printorder values
									SELECT distinct f.ids, min(x.ids) as myIDS, max(printorder) as score
									FROM [bs_StwPh_28311159_2015].[dbo].[SKzEx] y
									INNER JOIN [StwPh_28311159_2015].[dbo].[SKz] x
									ON y.ID = x.ID
										LEFT JOIN (
											SELECT ID, RefAG, RefParam, RefParamList
											FROM dbo.SkRefParamList
											WHERE RefParam = 35
										) as e
										ON x.ID = e.RefAg

										LEFT JOIN (
											SELECT ID, RefAG, IDS
											FROM dbo.SkParamList
											WHERE RefAG = 35
										) as f
										ON e.RefParamList = f.ID
										-- for that product's variants
										WHERE x.ids = a.ids AND y.isCluster = 0
										group by f.ids
								) m
							)
							-- if it's not Boty
							ELSE
							(
								-- sum the score
								SELECT SUM(m.score)
								FROM
								(
									-- of the unique (by Velikost-F-UK) printorders
									SELECT distinct f.ids, min(x.ids) as myIDS, max(printorder) as score
									FROM [bs_StwPh_28311159_2015].[dbo].[SKzEx] y
									INNER JOIN [StwPh_28311159_2015].[dbo].[SKz] x
									ON y.ID = x.ID
										LEFT JOIN (
											SELECT ID, RefAG, RefParam, RefParamList
											FROM dbo.SkRefParamList
											WHERE RefParam = 32
										) as e
										ON x.ID = e.RefAg

										LEFT JOIN (
											SELECT ID, RefAG, IDS
											FROM dbo.SkParamList
											WHERE RefAG = 32
										) as f
										ON e.RefParamList = f.ID
										-- for that product's variants
										WHERE x.ids = a.ids AND y.isCluster = 0
										group by f.ids
								) m
							)
							END

						)
						-- and add points for other parameters
						+ case when (VPrNovinka = 1) then 10 else 0 end
						+ VPrPriorita


FROM [bs_StwPh_28311159_2015].[dbo].[SKzEx] b
INNER JOIN [StwPh_28311159_2015].[dbo].[SKz] a
ON b.ID = a.ID

where IDS = 'S17606' and b.isCluster = 1

*/

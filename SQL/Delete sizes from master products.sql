/* Mazání internetových parametrů u master produktů Nike a Adidas */
/* Jsou dvě tabulky, jedna určující internetový parametr (SKRefParam), druhá určující hodnotu, pokud je typ int. param. seznam (SKRefParamList). Z obou se to musí smazat. */
DELETE FROM dbo.SKRefParam WHERE
	RefAg IN (SELECT ID FROM dbo.SKz WHERE (((SKz.EAN Is Null) AND (SKz.IDS Is Not Null)) AND ((SKz.VPrZnacka LIKE '%adidas%') OR (SKz.VPrZnacka LIKE '%Nike%'))))
	AND RefParam IN (32, 33, 34, 35, 40)
DELETE FROM dbo.SKRefParamList WHERE
	RefAg IN (SELECT ID FROM dbo.SKz WHERE (((SKz.EAN Is Null) AND (SKz.IDS Is Not Null)) AND ((SKz.VPrZnacka LIKE '%adidas%') OR (SKz.VPrZnacka LIKE '%Nike%'))))
	AND RefParam IN (32, 33, 34, 35, 40)	
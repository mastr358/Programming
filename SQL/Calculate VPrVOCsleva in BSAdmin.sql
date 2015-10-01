-- Když je zadaná aspoň jedna sleva, vypočítej VPrVOCsleva s větší slevou
update dbo.SKz set VPrVOCsleva =
	(CASE
		WHEN VPrSlevaSpecial > VPrSlevaStandart 
		THEN round(NakupC * (1 - VPrSlevaSpecial/100),0)
		WHEN VPrSlevaSpecial <= VPrSlevaStandart 
		THEN round(NakupC * (1 - VPrSlevaStandart/100),0)
	END)
where VPrSlevaSpecial is not null OR VPrSlevaStandart is not null

-- když není sleva zadaná, zkopíruj NakupC
update dbo.SKz set VPrVOCsleva = NakupC where VPrSlevaSpecial is null and VPrSlevaStandart is null


-- testovací výpis !!smazat v ostrém skriptu!!
select NakupC, VPrVOCsleva, VPrSlevaSpecial, VPrSlevaStandart from dbo.skz where VPrSlevaSpecial is not null
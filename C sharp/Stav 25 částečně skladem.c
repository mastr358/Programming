//uzavřeno do vydaných objednávek, skladem víc než 60%, cena >3000, dnes>datum Od, nebylo v tomto stavu, neposílat víckrát (nastavuje se v notifikacích)

return

//kdyz je ve vydanych objednavkach
GetBool("Obj_VPrOrderClosed") &&

//nebylo v tomto stavu
!GetBool("ByloVeStavu_P-CastSkld") &&

//Cena vic jak 3000Kc
GetInt("Obj_KcCelkem") >= 3000 &&

//pokud ma se resit
(	
	//kdyz neni prazdne datum od
	(!IsEmpty("Obj_DatOd") && DateTime.Today >= GetDateTime("Obj_DatOd")) ||
	//kdyz je prazdne datum od
	IsEmpty("Obj_DatOd")
) &&

// pokud je objednano vic jak 1 polozka
(((GetInt("Obj_RelForUh") == 19 || GetInt("Obj_RelForUh") == 6) && (GetInt("Obj_ZbyvaDodat") + GetInt("Obj_ByloDodano") > 3)) || 
(GetInt("Obj_ZbyvaDodat") + GetInt("Obj_ByloDodano") > 2)) &&

//pokud bylo preneseno vic jak 60%
(
	//pokud je to na dobirku (19) nebo kartou, odectu 2 polozky
	((GetInt("Obj_RelForUh") == 19 || GetInt("Obj_RelForUh") == 6) && ((GetDouble("Obj_VPrSklademKs")/(GetDouble("Obj_ZbyvaDodat")-2))>0.6)) ||

	//pokud je to jina platba, odectu 1 polozku
	(!(GetInt("Obj_RelForUh") == 19) && ((GetDouble("Obj_VPrSklademKs")/(GetDouble("Obj_ZbyvaDodat")-1))>0.6))
);
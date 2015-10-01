//neni B2B AND
//nastalo datum od, pokud je vyplneno
//uzavřeno do vydaných objednávek AND
//všechno skladem AND
//(((zaplaceno příkazem OR Zaplaceno příkazem (boolean)) OR (kartou zaplaceno) OR (placeno hotově) OR (placeno dobírkou))
//   OR (zašrtnuta výměna, zboží skladem, existuje dobropis))


return
//neni B2B
!GetBool("Obj_VPrB2B") &&

//nastalo datum od, pokud je vyplneno
(IsEmpty("Obj_DatOd") || DateTime.Today>=GetDateTime("Obj_DatOd")) &&

//Uzavřeno do vydaných objednávek 
GetBool("Obj_VPrOrderClosed") && 

//vse mame na sklade
GetBool("KompletneSkladem") &&

//a je to normalni objednavka
	(
	    !(GetBool("Obj_VPrVymena")) &&
		
		//plati se prikazem
		(
			GetBool("ZalohovaFaktura") && 
		
			//a je zaplacena dnes (VPrZaplPrikaz) nebo vcera (banka)
			(GetBool("Obj_VPrZaplPrikaz") || GetBool("ZalohovaFakturaZaplacena"))
		
		) ||
	
		//nebo je platba kartou schvalena
		GetBool("OnlinePlatbaOverena") ||
		
		//nebo je to placeno dobirkou
		GetInt("Obj_RelForUh") == 19 ||
		
		//nebo je to placeno hotove
		GetInt("Obj_RelForUh") == 2
		
	) ||
		
//nebo je to vymena
	(
		GetBool("Obj_VPrVymena") &&
		GetBool("Obj_VPrDobropis")
	);
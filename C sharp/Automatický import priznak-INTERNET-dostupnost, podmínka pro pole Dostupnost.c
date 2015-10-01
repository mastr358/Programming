Pokud((GetInt(StavZ) = 0 && GetInt(VPrDodPocet) < 5), "nedost.",
Pokud(VPrDodSklad="DE Uffenheim","3-6 dní",
 Pokud(VPrDodSklad="DE Rieste","3-6 dní",
  Pokud(VPrDodSklad="DE Scheinfeld","3-6 dní",
   Pokud(VPrDodSklad="NL Moerdijk","4-7 dní",
    Pokud(VPrDodSklad="adidas","3-6 dní",
     Pokud(VPrDodSklad="Reebok","4-7 dní",
      Pokud(VPrDodSklad="Nike","4-7 dní",
       Pokud(VPrDodSklad="Puma","4-7 dní",
        Pokud(VPrDodSklad="Neni","nedost.",
"3-6 dní"))))))))))


//nebo
if((GetInt("StavZ") == 0) && (GetInt("VPrDodPocet") < 5)) return "nedost.";
if(GetString("Obj_VPrDodSklad") == "DE Uffenheim") return "3-6 dní";
if(GetString("Obj_VPrDodSklad") == "DE Rieste") return "3-6 dní";
if(GetString("Obj_VPrDodSklad") == "DE Scheinfeld") return "3-6 dní";
if(GetString("Obj_VPrDodSklad") == "NL Moerdijk") return "4-7 dní";
if(GetString("Obj_VPrDodSklad") == "adidas") return "3-6 dní";
if(GetString("Obj_VPrDodSklad") == "Reebok") return "4-7 dní";
if(GetString("Obj_VPrDodSklad") == "Nike") return "4-7 dní";
if(GetString("Obj_VPrDodSklad") == "Puma") return "4-7 dní";
if(GetString("Obj_VPrDodSklad") == "Neni") return "nedost.";
return "3-6 dní";
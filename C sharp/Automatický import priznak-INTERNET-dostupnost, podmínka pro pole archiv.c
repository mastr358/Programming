if (GetString("VPrDodSklad") == "Ryby") return false;
if (GetBool("VPrGledis")==false && GetBool("VPrGledis2")==false) return false;
if(GetInt("zasoby") > 0)return false;
if(GetInt("VPrDodPocet") < 5)return true;
var endD = GetDateTime("VPrDodDatum");
var startD = DateTime.Today;

// spocteme pocet pracovnich dnu mezi datumy
double calcBusinessDays = 1 + ((endD - startD).TotalDays * 5 - (startD.DayOfWeek - endD.DayOfWeek) * 2) / 7;
if ((int)endD.DayOfWeek == 6) calcBusinessDays--;
if ((int)startD.DayOfWeek == 0) calcBusinessDays--;

//ShowInfo(calcBusinessDays);

if(calcBusinessDays < 4)return false;

return true;

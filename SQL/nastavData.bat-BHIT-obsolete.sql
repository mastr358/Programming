set instance=SDELL\POHODASQL
set db=StwPh_28311159_2015

SQLCmd -S %instance% -d %db% -Q "update skz set VPrDatDoprodej=cast(GETDATE() as date),VPrDatDosklad=NULL where VPrDatDoprodej is null and isnull(StavZ-Rezer-ObjedP,0)<=0"
SQLCmd -S %instance% -d %db% -Q "update skz set VPrDatDosklad=cast(GETDATE() as date),VPrDatDoprodej=NULL where VPrDatDosklad is null and isnull(StavZ-Rezer-ObjedP,0)>0"
SQLCmd -S %instance% -d %db% -Q "update skz set VPrDobaDostup=DATEDIFF(d,VPrDatDosklad,cast(GETDATE() as date)) where not VPrDatDosklad is null and isnull(VPrDobaDostup,0)<DATEDIFF(d,VPrDatDosklad,cast(GETDATE() as date))"


SQLCmd -S %instance% -d %db% -Q "update skz set VPrDatDoprodejD=cast(GETDATE() as date),VPrDatDoskladD=NULL where VPrDatDoprodejD is null and isnull(StavZ+isnull(VPrDodPocet,0)-Rezer-ObjedP,0)<=0"
SQLCmd -S %instance% -d %db% -Q "update skz set VPrDatDoskladD=cast(GETDATE() as date),VPrDatDoprodejD=NULL where VPrDatDoskladD is null and isnull(StavZ+isnull(VPrDodPocet,0)-Rezer-ObjedP,0)>0"
SQLCmd -S %instance% -d %db% -Q "update skz set VPrDobaDostupD=DATEDIFF(d,VPrDatDoskladD,cast(GETDATE() as date)) where not VPrDatDoskladD is null and isnull(VPrDobaDostupD,0)<DATEDIFF(d,VPrDatDoskladD,cast(GETDATE() as date))"

SQLCmd -S %instance% -d %db% -Q "update skz set vprlezak = case when not VPrDatDoprodej IS null then null else datediff(DAY,(select max(datum) from skzpoh where refskz=skz.id and RelOP=2),GETDATE()) end"
SQLCmd -S %instance% -d %db% -Q "update skz set VPrLezak = datediff(DAY,VPrDatDosklad,GETDATE()) where isnull(VPrLezak,9999)>datediff(DAY,VPrDatDosklad,GETDATE())"

SQLCmd -S %instance% -d %db% -Q "update SKz set VPrDobaDostupArt=(select MAX(VPrDobaDostup) from SKz polozky where polozky.IDS=skz.IDS), VPrDobaDostupDAr=(select MAX(VPrDobaDostupD) from SKz polozky where polozky.IDS=skz.IDS), VPrLezakArt=(select MIN(VPrLezak) from SKz polozky where polozky.IDS=skz.IDS) where VPrIsMain=1"

SQLCmd -S %instance% -d %db% -Q "update SKz set VPrDniDostup=DATEDIFF(day,ISNULL(VPrDniDostupKont,VPrDatDosklad),cast(GETDATE() as date)),VPrDniDostupKont=cast(GETDATE() as date) where ISNULL(VPrDniDostupKont,VPrDatDosklad)<cast(GETDATE() as date) and not VPrDatDosklad is null"
SQLCmd -S %instance% -d %db% -Q "update SKz set VPrDniDostupD=DATEDIFF(day,ISNULL(VPrDniDostupDKon,VPrDatDoskladD),cast(GETDATE() as date)),VPrDniDostupDKon=cast(GETDATE() as date) where ISNULL(VPrDniDostupDKon,VPrDatDoskladD)<cast(GETDATE() as date) and not VPrDatDosklad is null"



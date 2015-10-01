-- 7.7.2015 (Štrbák) - změněny čísla pro eshop_visibility, aby se výrobci adidas, puma a reebok zobrazovaly také na total-store
-- 2.4. (Štrbák) - přidána podmínka pro obchod zlaty-kapr - v poli "dodavatel sklad" je uvedeno "Ryby"
-- ringit 1
-- a-mania 2
-- a-mania + ringit 3
-- a-mania + ringit + total-store 7
-- total-store 4
-- total-store + ringit 5
-- total-store + a-mania 6
-- total-store + style-puma 12
-- total-store + rb-store 20
-- style-puma 8
-- style-puma + ringit 9
-- style-puma + ringit + total-store 13
-- rb-store 16
-- rb-store + ringit 17
-- rb-store + ringit + total-store 21
-- zlaty-kapr 32

update $DB_BS$.dbo.SKzEx set eshop_visibility = 1 where id in (select id from $DB$.dbo.SKz where VPrGledis<>0 and VPrGledis2=0)
 and ISNULL(eshop_visibility,0) <> 1 and cluster is null

update $DB_BS$.dbo.SKzEx set eshop_visibility = 6 where id in (select id from $DB$.dbo.SKz where VPrGledis=0
 and VPrGledis2<>0 and vyrobce like '%adidas%') and ISNULL(eshop_visibility,0) <> 6 and cluster is null
update $DB_BS$.dbo.SKzEx set eshop_visibility = 7 where id in (select id from $DB$.dbo.SKz where VPrGledis<>0
 and VPrGledis2<>0 and vyrobce like '%adidas%') and ISNULL(eshop_visibility,0) <> 7 and cluster is null

update $DB_BS$.dbo.SKzEx set eshop_visibility = 4 where id in (select id from $DB$.dbo.SKz where VPrGledis=0
 and VPrGledis2<>0 and (vyrobce like '%nike%' OR vyrobce like '%converse%' OR vyrobce like '%neill%')) and ISNULL(eshop_visibility,0) <> 4 and cluster is null
update $DB_BS$.dbo.SKzEx set eshop_visibility = 5 where id in (select id from $DB$.dbo.SKz where VPrGledis<>0
 and VPrGledis2<>0 and (vyrobce like '%nike%' OR vyrobce like '%converse%' OR vyrobce like '%neill%'))and ISNULL(eshop_visibility,0) <> 5 and cluster is null

update $DB_BS$.dbo.SKzEx set eshop_visibility = 12 where id in (select id from $DB$.dbo.SKz where VPrGledis=0
 and VPrGledis2<>0 and vyrobce like '%puma%')  and ISNULL(eshop_visibility,0) <> 12 and cluster is null
update $DB_BS$.dbo.SKzEx set eshop_visibility = 13 where id in (select id from $DB$.dbo.SKz where VPrGledis<>0
 and VPrGledis2<>0 and vyrobce like '%puma%') and ISNULL(eshop_visibility,0) <> 13 and cluster is null

update $DB_BS$.dbo.SKzEx set eshop_visibility = 20 where id in (select id from $DB$.dbo.SKz where VPrGledis=0
 and VPrGledis2<>0 and vyrobce like '%reebok%') and ISNULL(eshop_visibility,0) <> 20 and cluster is null
update $DB_BS$.dbo.SKzEx set eshop_visibility = 21 where id in (select id from $DB$.dbo.SKz where VPrGledis<>0
 and VPrGledis2<>0 and vyrobce like '%reebok%') and ISNULL(eshop_visibility,0) <> 21 and cluster is null

update $DB_BS$.dbo.SKzEx set eshop_visibility = 32 where id in (select id from $DB$.dbo.SKz where VPrGledis<>0
and VPrDodSklad = 'Ryby') and ISNULL(eshop_visibility,0) <> 32 and cluster is null

update variant set variant.eshop_visibility = master.eshop_visibility 
from $DB_BS$.dbo.SKzEx variant
inner join $DB_BS$.dbo.SKzEx master on master.id=variant.cluster
where variant.cluster is not null
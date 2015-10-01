--ringit 1
--amania 2
--total store 4
--stylepuma 8
--rb-store 16


update $DB_BS$.dbo.SKzEx set eshop_visibility = 1 where id in (select id from $DB$.dbo.SKz where VPrGledis<>0 and VPrGledis2=0)
 and ISNULL(eshop_visibility,0) <> 1 and cluster is null

update $DB_BS$.dbo.SKzEx set eshop_visibility = 2 where id in (select id from $DB$.dbo.SKz where VPrGledis=0
 and VPrGledis2<>0 and vyrobce like '%adidas%') and ISNULL(eshop_visibility,0) <> 2 and cluster is null
update $DB_BS$.dbo.SKzEx set eshop_visibility = 3 where id in (select id from $DB$.dbo.SKz where VPrGledis<>0
 and VPrGledis2<>0 and vyrobce like '%adidas%') and ISNULL(eshop_visibility,0) <> 3 and cluster is null

update $DB_BS$.dbo.SKzEx set eshop_visibility = 4 where id in (select id from $DB$.dbo.SKz where VPrGledis=0
 and VPrGledis2<>0 and (vyrobce like '%nike%' OR vyrobce like '%converse%' OR vyrobce like '%neill%')) and ISNULL(eshop_visibility,0) <> 4 and cluster is null
update $DB_BS$.dbo.SKzEx set eshop_visibility = 5 where id in (select id from $DB$.dbo.SKz where VPrGledis<>0
 and VPrGledis2<>0 and (vyrobce like '%nike%' OR vyrobce like '%converse%' OR vyrobce like '%neill%'))and ISNULL(eshop_visibility,0) <> 5 and cluster is null

update $DB_BS$.dbo.SKzEx set eshop_visibility = 8 where id in (select id from $DB$.dbo.SKz where VPrGledis=0
 and VPrGledis2<>0 and vyrobce like '%puma%')  and ISNULL(eshop_visibility,0) <> 8 and cluster is null
update $DB_BS$.dbo.SKzEx set eshop_visibility = 9 where id in (select id from $DB$.dbo.SKz where VPrGledis<>0
 and VPrGledis2<>0 and vyrobce like '%puma%') and ISNULL(eshop_visibility,0) <> 9 and cluster is null

update $DB_BS$.dbo.SKzEx set eshop_visibility = 16 where id in (select id from $DB$.dbo.SKz where VPrGledis=0
 and VPrGledis2<>0 and vyrobce like '%reebok%') and ISNULL(eshop_visibility,0) <> 16 and cluster is null
update $DB_BS$.dbo.SKzEx set eshop_visibility = 17 where id in (select id from $DB$.dbo.SKz where VPrGledis<>0
 and VPrGledis2<>0 and vyrobce like '%reebok%') and ISNULL(eshop_visibility,0) <> 17 and cluster is null

update variant set variant.eshop_visibility = master.eshop_visibility 
from $DB_BS$.dbo.SKzEx variant
inner join $DB_BS$.dbo.SKzEx master on master.id=variant.cluster
where variant.cluster is not null
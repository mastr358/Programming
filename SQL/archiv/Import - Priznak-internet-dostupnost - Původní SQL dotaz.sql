-- původně:
select s.id, s.VPrDodPocet, s.VPrDodDatum, s.VPrDodSklad, s.VPrGledis, s. VPrGledis2, t.zasoby from $DB$.dbo.skz s
inner join 
(
select EAN, sum(stavz-objedp-rezer) as zasoby from $DB$.dbo.skz
where refsklad in (18,19) and ean is not null 
group by EAN
) t
on s.ean = t.ean
where s.RefSklad = 18
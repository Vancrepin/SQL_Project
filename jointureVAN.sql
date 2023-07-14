-- 2. JOINTURES 
-- 1. Noms et prénoms des salariés ayant la compétence « JAVASCRIPT » ? 
Select i.Nom, i.prenom
from ingenieur i
inner join ing_cpc ic
on i.mle = ic.mle
where ic.compet = 'JAVASCRIPT'

-- 2. Quel est le client (code client) ayant au moins un projet sur Lille ? 
Select c.codcli, c.design, p.ville
from client c
inner join cli_pro cp
on c.codcli= cp.codcli
inner join projet p
on p.codpro =  cp.codpro
where p.ville = 'LILLE'



-- 3. Lister les noms, prénoms, date d’entrée des ingénieurs appartenant au département 7.

Select i.Nom, i.prenom, e.datent
from ingenieur i
inner join emploi e
on i.mle = e.mle
inner join Dept d
on e.codept = d.codept
where datent <= current_date
and (datsor is null or datsor >= current_date)
and d.codept = 7

-- Même liste, mais triée par date d'entrée croissante. 

Select i.Nom, i.prenom, e.datent
from ingenieur i
inner join emploi e
on i.mle = e.mle
inner join Dept d
on e.codept = d.codept
where datent <= current_date
and (datsor is null or datsor >= current_date)
and d.codept = 7
order by datent

-- 5. Liste des noms de salariés actuellement dans le département 7, avec leslibellés de leurs projets en cours. Préciser également leur prix de vente à chaque fois sur ces projets. 
select i.nom, p.libpro, a.Pvente
from ingenieur i
inner join affect a
on i.mle = a.mle
inner join emploi e
on i.mle = e.mle
inner join projet p
on a.codpro = p.codpro
where e.codept = 7
AND e.datent <= current_date
AND (e.datsor is  null or e.datsor >= current_date )
AND a.datdeb <= current_date
AND (a.datfin is  null or a.datfin >= current_date)

-- 5. Même liste, mais triée par code projet décroissant. 

select i.nom, p.libpro, a.Pvente
from ingenieur i
inner join affect a
on i.mle = a.mle
inner join emploi e
on i.mle = e.mle
inner join projet p
on a.codpro = p.codpro
where e.codept = 7
AND e.datent <= current_date
AND (e.datsor is  null or e.datsor >= current_date )
AND a.datdeb <= current_date
AND (a.datfin is  null or a.datfin >= current_date)
 order by p.codpro DESC




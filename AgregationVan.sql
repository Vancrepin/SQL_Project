-- 4. FONCTIONS D’AGREGATION - PARTITIONNEMENT 
-- 1. Quelle est le coût total de tous les projets 

select sum(p.cout)
 from projet p
-- 2. Quel est la plus ancienne date d'arrivée dans le département 3, et la plus récente ? 
select min(e.datent) as premiere_date, max(e.datent) as dernière_date
from emploi e
inner join dept d
on d.codept = e.codept
where d.codept = 3
  
-- 3. Combien y a-t-il de fonctions répertoriées dans la table AFFECT ?
select count (distinct(a.fonction))
from affect a
 -- 4. Combien de salariés habitent Montpellier ? 
 
select count(i.ville) as habitants_sur_montpellier
from ingenieur i
where i.ville = 'MONTPELLIER'

-- 5. Donner le prix de vente moyen pour le projet 120 au 1er janvier 2008
select avg(a.pvente) as pv_moyen_120
from affect a
inner join projet p
on p.codpro = a.codpro
where p.codpro = 120 
And a.datdeb <='2008-01-01'
AND (a.datfin is null or a.datfin >= '2008-01-01')

-- 6 Combien y a-t-il de salariés par département au 1er janvier 2008 ? 

select e.codept, count(e.mle) as nombre_salariés
from  emploi e
inner join dept d
on e.codept = d.codept
where e.datent <='2008-01-01'
AND (e.datsor is null or e.datsor >= '2008-01-01')
group by e.codept 
order by e.codept

-- 7. Prix de vente moyen des ingénieurs de chaque projet au 1er janvier 2008. Uniquement pour les projets dont le prix de vente moyen est au moins égal à 2500

select p.codpro, avg(a.pvente) as prix_vente_moyen
from  affect a
inner join projet p
on p.codpro = a.codpro
where a.datdeb <='2008-01-01'
AND (a.datfin is null or a.datfin >= '2008-01-01')
group by p.codpro 
having avg(a.pvente)>= 2500

-- 8. Depuis la toute dernière embauche dans la société, quelles affectations sur projets ont eu lieu ? 
select *
from affect a
where a.datdeb >(select max(e.datent)
from  emploi e
where e.datent < current_date)
and a.datdeb < '2025-01-01'

-- 9.Quel ingénieur a été affecté à plusieurs reprises sur le projet 17 ? 
 select count (a.codpro), a.mle
 from affect a
 Where a.codpro = 17
 Group by a.mle
select d.Num_dpt, d.Nom_dpt, d.Ciutat_dpt
from departaments d natural inner join empleats e
where not exists(select *
				 from empleats e2
				 where e.num_dpt = e2.num_dpt and e.num_proj != e2.num_proj)
group by d.num_dpt
select d.num_dpt, d.nom_dpt
from departaments d natural inner join empleats e
where exists(select * from empleats e2 where e.ciutat_empl = e2.ciutat_empl and e.num_empl != e2.num_empl)
group by d.num_dpt
having count(e.ciutat_empl) >= 2
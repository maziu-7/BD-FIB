insert into cost_ciutat
select distinct d.ciutat_dpt, 0
from departaments d
where not exists(select * from empleats e, departaments d2
			     where e.num_dpt = d2.num_dpt and d.ciutat_dpt = d2.ciutat_dpt)
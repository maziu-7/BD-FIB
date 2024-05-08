select D.NUM_DPT, D.NOM_DPT, AVG(E.SOU)
from DEPARTAMENTS D inner join EMPLEATS E
on D.NUM_DPT = E.NUM_DPT where D.CIUTAT_DPT = 'MADRID'
group by D.NUM_DPT
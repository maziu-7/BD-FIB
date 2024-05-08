select D.NOM_DPT, P.NOM_PROJ
from EMPLEATS E natural inner join DEPARTAMENTS D natural inner join PROJECTES P
WHERE E.NUM_EMPL = 2
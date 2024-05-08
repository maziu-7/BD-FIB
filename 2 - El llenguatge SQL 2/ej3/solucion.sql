select D.NUM_DPT, D.NOM_DPT from DEPARTAMENTS D, EMPLEATS E
where D.NUM_DPT = E.NUM_DPT
group by D.NUM_DPT
having 2 <= COUNT(distinct E.CIUTAT_EMPL)
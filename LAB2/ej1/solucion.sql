select D.NUM_DPT, D.NOM_DPT from DEPARTAMENTS D
where not EXISTS(
	select from EMPLEATS E where E.NUM_DPT = D.NUM_DPT and E.CIUTAT_EMPL = 'MADRID'
)
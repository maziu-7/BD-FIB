select distinct E.CIUTAT_EMPL from EMPLEATS E
	where not EXISTS(select D.CIUTAT_DPT
					from DEPARTAMENTS D where E.CIUTAT_EMPL = D.CIUTAT_DPT)
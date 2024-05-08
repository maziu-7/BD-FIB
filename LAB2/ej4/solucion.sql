create table comandes
		(	numComanda INTEGER,
			instantComanda INTEGER not null,
			client CHAR(30),
			unique (instantComanda, client),
			encarregat INTEGER not null,
			supervisor INTEGER,
			primary key (numComanda),
			foreign key (encarregat) references EMPLEATS (num_empl),
			foreign key (supervisor) references EMPLEATS (num_empl)
		);
		
create table productesComprats
		(	numComanda INTEGER not null,
			producte CHAR(20),
			quantitat INTEGER not null default 1,
			preu INTEGER,
			primary key (numComanda, producte),
			foreign key (numComanda) references comandes (numComanda)
		);
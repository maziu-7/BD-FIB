create table socis ( nsoci char(10) primary key, sexe char(1) not null);

create table clubs ( nclub char(10) primary key);

create table socisclubs (nsoci char(10) not null references socis, 
  nclub char(10) not null references clubs, 
  primary key(nsoci, nclub));

create table clubs_amb_mes_de_5_socis (nclub char(10) primary key references clubs);

create table missatgesExcepcions(
	num integer, 
	texte varchar(50)
	);

	
	
insert into missatgesExcepcions values(1, 'Club amb mes de 10 socis');
insert into missatgesExcepcions values(2, 'Club amb mes homes que dones');
insert into missatgesExcepcions values(3, 'Soci ja assignat a aquest club');
insert into missatgesExcepcions values(4, 'O el soci o el club no existeixen');
insert into missatgesExcepcions values(5, 'Error intern');

insert into clubs values ('escacs');
insert into clubs values ('petanca');

insert into socis values ('anna','F');

insert into socis values ('joanna','F');
insert into socis values ('josefa','F');
insert into socis values ('pere','M');

insert into socisclubs values('joanna','petanca');
insert into socisclubs values('josefa','petanca');
insert into socisclubs values('pere','petanca');
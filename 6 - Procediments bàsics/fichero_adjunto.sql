-- Sent�ncies d'esborrat de la base de dades:
drop table lloguers_actius;
drop table treballadors;
drop table cotxes;
drop table missatgesExcepcions;
drop function  llistat_treb(char(8), char(8));

-- Sent�ncies de preparaci� de la base de dades:
create table cotxes(
	matricula char(10) primary key,
	marca char(20) not null,
	model char(20) not null,
	categoria integer not null,
	color char(10),
	any_fab integer
	);
create table treballadors(
	dni char(8) primary key,
	nom char(30) not null,
	sou_base real not null,
	plus real not null
	);
create table lloguers_actius(
	matricula char(10) primary key    references cotxes,
	dni char(8) not null constraint fk_treb  references treballadors,
	num_dies integer not null,
	preu_total real not null
	);

create table missatgesExcepcions(
	num integer, 
	texte varchar(50)
	);
insert into missatgesExcepcions values(1,'No hi ha cap tupla dins del interval demanat');
insert into missatgesExcepcions values(2, 'Error intern');

--------------------------
-- Joc de proves Public
--------------------------

-- Sent�ncies de neteja de les taules:
delete from lloguers_actius;
delete from treballadors;
delete from cotxes;

-- Sent�ncies d'inicialitzaci�:
insert into cotxes values ('1111111111','Audi','A4',1,'Vermell',1998);
insert into cotxes values ('2222222222','Audi','A3',2,'Blanc',1998);
insert into cotxes values ('3333333333','Volskwagen','Golf',2,'Blau',1990);
insert into cotxes values ('4444444444','Toyota','Corola',3,'groc',1999);
insert into cotxes values ('5555555555','Honda','Civic',3,'Vermell',2000);
insert into cotxes values ('6666666666','BMW','Mini',2,'Vermell',2000);

insert into treballadors values ('22222222','Joan',1700,150);

insert into lloguers_actius values ('1111111111','22222222',7,750);
insert into lloguers_actius values ('2222222222','22222222',5,550);
insert into lloguers_actius values ('3333333333','22222222',4,450);
insert into lloguers_actius values ('4444444444','22222222',8,850);
insert into lloguers_actius values ('5555555555','22222222',2,250);














-- Sent�ncies de preparaci� de la base de dades:
create table professors
(dni char(50),
nomProf char(50) unique,
telefon char(15),
sou integer not null check(sou>0),
primary key (dni));

create table despatxos
(modul char(5), 
numero char(5), 
superficie integer not null check(superficie>12),
primary key (modul,numero));

create table assignacions
(dni char(50), 
modul char(5), 
numero char(5), 
instantInici integer, 
instantFi integer,
primary key (dni, modul, numero, instantInici),
foreign key (dni) references professors,
foreign key (modul,numero) references despatxos);
-- instantFi te valor null quan una assignacio es encara vigent.

-- Sent�ncies d'esborrat de la base de dades:
DROP TABLE assignacions;
DROP TABLE despatxos;
DROP TABLE professors;

--------------------------
-- Joc de proves Public
--------------------------

-- Sent�ncies d'inicialitzaci�:
insert into professors values('111','toni','3111',100);
insert into professors values('222','pere','4111',200);

insert into despatxos values('omega','118',16);

insert into assignacions values('111','omega','118',109,344);
insert into assignacions values('222','omega','118',345,null);

-- Sent�ncies de neteja de les taules:
DELETE FROM assignacions;
DELETE FROM despatxos;
DELETE FROM professors;




















CREATE TABLE empleats(
  nempl integer primary key,
  salari integer);

insert into empleats values(1,1000);

insert into empleats values(2,2000);

insert into empleats values(123,3000);

CREATE TABLE dia(
dia char(10));

insert into dia values('dijous');

create table missatgesExcepcions(
	num integer, 
	texte varchar(50)
	);
insert into missatgesExcepcions values(1,'No es poden esborrar empleats el dijous');
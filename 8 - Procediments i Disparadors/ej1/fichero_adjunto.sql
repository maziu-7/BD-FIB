create table empleats1 (nemp1 integer primary key, nom1 char(25), ciutat1 char(10) not null);

create table empleats2 (nemp2 integer primary key, nom2 char(25), ciutat2 char(10) not null);

insert into empleats2 values(1,'joan','bcn');
insert into empleats2 values(2,'pere','mad');
insert into empleats2 values(3,'enric','bcn');
insert into empleats1 values(1,'joan','bcn');
insert into empleats1 values(2,'maria','mad');


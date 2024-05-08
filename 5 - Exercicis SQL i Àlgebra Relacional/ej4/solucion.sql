create table presentacioTFG(
		idEstudiant char(100),
		titolTFG char(100) not null,
		dniDirector char(50) not null check(dniDirector <> dniVocal and dniDirector <> dniPresident),
		dniPresident char(50) not null,
		dniVocal char(50) not null check(dniVocal <> dniPresident),
		instantPresentacio integer not null,
		nota integer check(0 <= nota and nota <= 10),
		primary key (idEstudiant),
		foreign key (dniVocal) references professors,
		foreign key (dniDirector) references professors,
		foreign key (dniPresident) references professors,
		unique(titolTFG, dniDirector));
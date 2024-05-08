-- Sent�ncies de preparaci� de la base de dades:
CREATE TABLE DEPARTAMENTS
         (	NUM_DPT INTEGER,
	NOM_DPT CHAR(20),
	PLANTA INTEGER,
	EDIFICI CHAR(30),
	CIUTAT_DPT CHAR(20),
	PRIMARY KEY (NUM_DPT));

CREATE TABLE PROJECTES
         (	NUM_PROJ INTEGER,
	NOM_PROJ CHAR(10),
	PRODUCTE CHAR(20),
	PRESSUPOST INTEGER,
	PRIMARY KEY (NUM_PROJ));

CREATE TABLE EMPLEATS
         (	NUM_EMPL INTEGER,
	NOM_EMPL CHAR(30),
	SOU INTEGER,
	CIUTAT_EMPL CHAR(20),
	NUM_DPT INTEGER,
	NUM_PROJ INTEGER,
	PRIMARY KEY (NUM_EMPL),
	FOREIGN KEY (NUM_DPT) REFERENCES DEPARTAMENTS (NUM_DPT),
	FOREIGN KEY (NUM_PROJ) REFERENCES PROJECTES (NUM_PROJ));

CREATE TABLE COST_CIUTAT
        (CIUTAT_DPT CHAR(20),
        COST INTEGER,
        PRIMARY KEY (CIUTAT_DPT));

-- Sent�ncies d'esborrat de la base de dades:
DROP TABLE cost_ciutat;
DROP TABLE empleats;
DROP TABLE departaments;
DROP TABLE projectes;

--------------------------
-- Joc de proves Public
--------------------------

-- Sent�ncies d'inicialitzaci�:
INSERT INTO  PROJECTES VALUES (3,'PR1123','TELEVISIO',600000);

INSERT INTO  DEPARTAMENTS VALUES (4,'MARKETING',3,'RIOS ROSAS','BARCELONA');

-- Sent�ncies de neteja de les taules:
delete from cost_ciutat;
delete from empleats;
delete from departaments;
delete from projectes;

















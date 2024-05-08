CREATE or replace FUNCTION assignar_individual(nomSoci char(10), nomClub char(10)) returns void AS $$
    DECLARE
		h int;
		d int;
		s char(1);
		missatge varchar(50);
    begin
	    if ((select count(*) from socisclubs sc where nomClub = sc.nclub) >= 10) then
    	SELECT texte INTO missatge FROM missatgesExcepcions WHERE num=1;
        RAISE EXCEPTION '%',missatge;
		end if;
		
		select count(*) into d from socis s natural inner join socisclubs sc where sc.nclub = nomClub and s.sexe = 'F';
		select count(*) into h from socis s natural inner join socisclubs sc where sc.nclub = nomClub and s.sexe = 'M';
		select s.sexe into s from socis s where s.nsoci = nomSoci;
		if (s = 'M' and d = h) then
		SELECT texte INTO missatge FROM missatgesExcepcions WHERE num=2;
        RAISE EXCEPTION '%',missatge;
		end if;
	
		if (exists(select * from socisclubs sc where sc.nsoci = nomSoci and nomClub = sc.nclub)) then
    	SELECT texte INTO missatge FROM missatgesExcepcions WHERE num=3;
        RAISE EXCEPTION '%',missatge;
		end if;
	
	    if (not exists(select * from clubs c where nomClub = c.nclub)) then
    	SELECT texte INTO missatge FROM missatgesExcepcions WHERE num=4;
        RAISE EXCEPTION '%',missatge;
		end if;
	
		if (not exists(select * from socis s where nomSoci = s.nsoci)) then
		SELECT texte INTO missatge FROM missatgesExcepcions WHERE num=4;
        RAISE EXCEPTION '%',missatge;
		end if;
		
		insert into socisclubs values(nomSoci, nomClub);
		
		if ((select count(*) from socisclubs sc where sc.nclub = nomClub) = 6) then
		insert into clubs_amb_mes_de_5_socis values (nomClub);
		end if;

    	EXCEPTION
       		WHEN raise_exception THEN
            	RAISE EXCEPTION '%',missatge;
            when foreign_key_violation then
            	SELECT texte INTO missatge FROM missatgesExcepcions WHERE num=4;
        		RAISE EXCEPTION '%',missatge;
            WHEN others THEN
            	SELECT texte INTO missatge FROM missatgesExcepcions WHERE num=5;
            	RAISE EXCEPTION '%',missatge;

	END;
$$LANGUAGE plpgsql;
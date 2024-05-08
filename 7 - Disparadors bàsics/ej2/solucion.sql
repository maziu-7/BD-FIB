create or replace FUNCTION dia_dijous() RETURNS trigger AS $$
	declare
	missatge varchar(100);
	dia_actual char(10);	

	begin
		select * into dia_actual from dia;
		if (dia_actual = 'dijous') then SELECT texte INTO missatge FROM missatgesExcepcions WHERE num=1;
        RAISE EXCEPTION '%',missatge;
        else return old;
		end if;

	exception
		when RAISE_EXCEPTION then RAISE EXCEPTION '%',sqlerrm;
END;
$$LANGUAGE plpgsql;

CREATE TRIGGER no_dijous BEFORE
delete ON empleats
FOR EACH statement EXECUTE PROCEDURE dia_dijous();
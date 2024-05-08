create or replace FUNCTION administrador() RETURNS trigger AS $$
	declare
	missatge varchar(100);

	BEGIN
		if (old.nempl = 123) then SELECT texte INTO missatge FROM missatgesExcepcions WHERE num=1;
        RAISE EXCEPTION '%',missatge;
		end if;
		if (TG_OP = 'UPDATE') then return new;
		else return old;
		end if;

	exception
		when RAISE_EXCEPTION then RAISE EXCEPTION '%',sqlerrm;
END;
$$LANGUAGE plpgsql;

CREATE TRIGGER empleat_123 BEFORE
delete or update of nempl ON empleats
FOR EACH ROW EXECUTE PROCEDURE administrador();
create or replace FUNCTION import_total() RETURNS trigger AS $$
	declare
	total integer;

	begin
		select preu into total from productes where new.idProducte = productes.idProducte;
		total = total*new.quantitat;
		update comandes set import = total+ import where comandes.numComanda = new.numComanda;
		return null;
		 
		
	exception
		when RAISE_EXCEPTION then RAISE EXCEPTION '%',sqlerrm;
END;
$$LANGUAGE plpgsql;

CREATE TRIGGER actualitza_import AFTER
insert ON liniesComandes
FOR EACH row EXECUTE PROCEDURE import_total();
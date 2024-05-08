create or replace FUNCTION treu_empl() RETURNS trigger AS $$
	begin
		if (exists(select e2.ciutat2 from empleats2 e2 where e2.ciutat2 = old.ciutat2))
		then return null;
		end if;
		delete from empleats1 e1 where e1.ciutat1 = old.ciutat2;
		return null;
		
	END;
$$LANGUAGE plpgsql;

CREATE TRIGGER del_empleat AFTER
delete or update of ciutat2 ON empleats2
FOR EACH ROW EXECUTE PROCEDURE treu_empl();
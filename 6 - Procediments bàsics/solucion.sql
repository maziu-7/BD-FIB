CREATE TYPE treballador as (
    dni varchar(8),
    nom varchar(30),
    sou_base real,
    sou_plus real,
    matricula varchar(30));

CREATE FUNCTION llistat_treb(dniIni char(8), dniFi char(8)) returns setof treballador AS $$
    DECLARE
        missatge varchar(50);
        t treballador;
        
    BEGIN
        for t IN SELECT * FROM treballadors WHERE (dni <= dniFi and dni >= dniIni) ORDER BY dni ASC
        LOOP
        IF ((select count(*) from lloguers_actius where dni = t.dni) > 4) THEN
            for t.matricula in select matricula from lloguers_actius WHERE dni = t.dni ORDER BY matricula ASC
        LOOP
        return next t;
        END loop;
        ELSE
            t.matricula := null;
            return next t;
        END IF;
        END LOOP;
        
    IF NOT found THEN
        SELECT texte INTO missatge FROM missatgesExcepcions WHERE num=1;
        RAISE EXCEPTION '%',missatge;
    END IF;

    EXCEPTION
       WHEN raise_exception THEN
            RAISE EXCEPTION '%',sqlerrm;
       WHEN others THEN
            SELECT texte INTO missatge FROM missatgesExcepcions WHERE num=2;
            RAISE EXCEPTION '%',missatge;
END;
$$LANGUAGE plpgsql;
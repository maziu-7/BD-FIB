select p.nomProf from professors p 
where (p.telefon is not null and p.sou > 2500) or
	        (p.telefon is null and not exists
				(select * from despatxos d natural inner join assignacions a
				where p.dni = a.dni and d.superficie < 20));
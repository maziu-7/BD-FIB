select modul, sum(instantFi - instantInici) as SUMAA
from assignacions
where instantFi is not null
group by modul
order by modul ASC
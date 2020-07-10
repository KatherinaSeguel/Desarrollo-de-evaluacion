Select count(p.idprestservicio)
from tdigital.prestservicio p
LEFT join tdigital.servicio s
on p.idservicio= s.idservicio
where p.fecha >= '01/10/2018'
and p.fecha <= '26/11/2018'
ORDER BY  idprestservicio;


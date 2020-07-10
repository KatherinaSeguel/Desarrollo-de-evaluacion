Select p.idprestservicio,p.fecha,s.nombreservicio
from tdigital.prestservicio p
LEFT join tdigital.servicio s
on p.idservicio= s.idservicio
where p.fecha >= '01/10/2018'
and p.fecha <= '26/11/2018'
ORDER BY  idprestservicio;


Select p.idprestservicio,p.fecha,v.marcavehiculo,v.modelovehiculo
from tdigital.prestservicio p
LEFT join tdigital.vehiculo v
on p.idvehiculo=v.idvehiculo
ORDER BY v.idvehiculo;


Select v.idvehiculo,v.marcavehiculo,v.modelovehiculo,count(p.idprestservicio)
from tdigital.prestservicio p
LEFT join tdigital.vehiculo v
on p.idvehiculo=v.idvehiculo
Group by v.idvehiculo,v.marcavehiculo,v.modelovehiculo
ORDER BY  v.idvehiculo,v.marcavehiculo,v.modelovehiculo;
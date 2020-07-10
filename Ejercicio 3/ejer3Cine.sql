
INSERT INTO tdigital.promocion VALUES (1,50,'De Lunes a Jueves antes de las 18:00',1,1);
INSERT INTO tdigital.promocion VALUES (2,20,'De Lunes a Jueves antes de las 14:00',2,2);
INSERT INTO tdigital.promocion VALUES (3,10,'De Lunes a Jueves  antes de las 18:00',3,3);
INSERT INTO tdigital.promocion VALUES (4,20,'De Sábado y Domingo antes de las 09:00',3,4);
INSERT INTO tdigital.promocion VALUES (5,20,'De Sábado y Domingo antes de las 09:00',2,5);
commit;

INSERT INTO tdigital.funcion VALUES (1,1,'Lunes',TO_DATE('10:00:00', 'HH24:MI:SS'),1);
INSERT INTO tdigital.funcion VALUES (2,2,'Martes',TO_DATE('11:00:00', 'HH24:MI:SS'),2);
INSERT INTO tdigital.funcion VALUES (3,3,'Sábado',TO_DATE('22:00:00', 'HH24:MI:SS'),3);
INSERT INTO tdigital.funcion VALUES (4,1,'Domingo',TO_DATE('23:00:00', 'HH24:MI:SS'),4);
INSERT INTO tdigital.funcion VALUES (5,2,'Miércoles',TO_DATE('10:00:00', 'HH24:MI:SS'),5);
commit;


Select count(v.idvehiculo) as total,v.marcavehiculo,v.modelovehiculo
from tdigital.vehiculo v
LEFT join tdigital.prestservicio p
on p.idvehiculo=v.idvehiculo
where total < 2

idprestservicio


SELECT idservicio,count(idprestservicio)as total
FROM prestservicio
WHERE total < 10
GROUP BY idvehiculo







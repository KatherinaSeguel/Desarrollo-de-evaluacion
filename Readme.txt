------------------------------------------------------------------------------------------------------------
EVALUACION
----------------------------------------------------------------------------------------------------------------
INSERT INTO tdigital.empleado VALUES (001,'Juan Soto',TO_DATE('1971-05-5 00:00:00', 'YYYY-MM-DD HH24:MI:SS'));
INSERT INTO tdigital.empleado VALUES (002,'Maria Alfaro',TO_DATE('1972-10-10 00:00:00', 'YYYY-MM-DD HH24:MI:SS'));
INSERT INTO tdigital.empleado VALUES (003,'Romina salazar',TO_DATE('1973-11-20 00:00:00', 'YYYY-MM-DD HH24:MI:SS'));
commit



INSERT INTO tdigital.prestservicio VALUES (38,1,1,1,TO_DATE('2020-05-5 00:00:00', 'YYYY-MM-DD HH24:MI:SS'));
INSERT INTO tdigital.prestservicio VALUES (39,2,2,2,TO_DATE('2020-05-10 00:00:00', 'YYYY-MM-DD HH24:MI:SS'));
INSERT INTO tdigital.prestservicio VALUES (40,3,3,3,TO_DATE('2020-05-20 00:00:00', 'YYYY-MM-DD HH24:MI:SS'));
commit

SELECT 1
Select p.idprestservicio,p.fecha,s.nombreservicio
from tdigital.prestservicio p
LEFT join tdigital.servicio s
on p.idservicio= s.idservicio
where p.fecha >= '01/10/2018'
and p.fecha <= '26/11/2018'
ORDER BY  idprestservicio;

RESULTADO:prestaciones de servicion entre 01/10/2018 y 26/11/2018

IDPRESTSERVICIO FECHA    NOMBRESERVICIO                
--------------- -------- ------------------------------
              1 01/10/18 Lavado Auto                   
              2 01/10/18 Cambio Aceite                 
              3 01/10/18 Cambio Balatas                
              4 02/10/18 Lavado Auto                   
              5 02/10/18 Cambio Aceite                 
              6 02/10/18 Cambio Balatas                
              7 03/10/18 Lavado Auto                   
              8 04/10/18 Cambio Aceite                 
              9 05/10/18 Cambio Balatas                
             10 06/10/18 Lavado Auto                   
             11 07/10/18 Cambio Aceite                 

IDPRESTSERVICIO FECHA    NOMBRESERVICIO                
--------------- -------- ------------------------------
             12 08/10/18 Cambio Balatas                
             13 09/10/18 Lavado Auto                   
             14 10/10/18 Cambio Aceite                 
             15 11/10/18 Cambio Balatas                
             16 12/10/18 Lavado Auto                   
             17 13/10/18 Cambio Aceite                 
             18 14/10/18 Cambio Balatas                
             19 15/10/18 Lavado Auto                   
             20 16/10/18 Cambio Aceite                 
             21 17/10/18 Cambio Balatas                
             22 18/10/18 Lavado Auto                   

IDPRESTSERVICIO FECHA    NOMBRESERVICIO                
--------------- -------- ------------------------------
             23 19/10/18 Cambio Aceite                 
             25 20/10/18 Cambio Balatas                
             26 12/11/18 Lavado Auto                   
             27 13/11/18 Cambio Aceite                 
             28 14/11/18 Cambio Balatas                
             29 15/11/18 Lavado Auto                   
             30 16/11/18 Cambio Aceite                 
             31 17/11/18 Cambio Balatas                
             32 18/11/18 Lavado Auto                   
             33 19/11/18 Cambio Aceite                 
             34 20/11/18 Cambio Balatas                

33 filas seleccionadas. 
---------------------------------------------------------------------------------

SELECT 2

Select count(v.idvehiculo),v.marcavehiculo,v.modelovehiculo
from tdigital.vehiculo v
LEFT join tdigital.prestservicio p
on p.idvehiculo=v.idvehiculo
GROUP BY v.idvehiculo,v.marcavehiculo,v.modelovehiculo;

RESULTADO:Mostrar la cantidad total de prestaciones agrupadas por vehículo.

COUNT(V.IDVEHICULO) MARCAVEHICULO                  MODELOVEHICULO                
------------------- ------------------------------ ------------------------------
                 20 Mazda                          CX-5                          
                 15 Hyundai                        Elantra                       
                  4 Hyundai                        Tucson                        

----------------------------------------------------------------------------------

SELECT 3

select *
from
(Select count(v.idvehiculo) as total,v.marcavehiculo,v.modelovehiculo
from tdigital.vehiculo v
LEFT join tdigital.prestservicio p
on p.idvehiculo=v.idvehiculo
GROUP BY v.idvehiculo,v.marcavehiculo,v.modelovehiculo
order by total asc )
where ROWNUM <= 1;

RESULTADO: Muestra el vehículo con la menor prestación.

     TOTAL MARCAVEHICULO                  MODELOVEHICULO                
---------- ------------------------------ ------------------------------
         4 Hyundai                        Tucson                        
---------------------------------------------------------------------------------------------------------


RESULTADO: Vehículo con la menor canidad de prestaciones
-------------------------------------------------------------------------------------------------

TABLA PROMOCIONES

INSERT INTO tdigital.promocion VALUES (1,50,'De Lunes a Jueves antes de las 18:00',1,1);
INSERT INTO tdigital.promocion VALUES (2,20,'De Lunes a Jueves antes de las 14:00',2,2);
INSERT INTO tdigital.promocion VALUES (3,10,'De Lunes a Jueves  antes de las 18:00',3,3);
INSERT INTO tdigital.promocion VALUES (4,20,'De Sábado y Domingo antes de las 09:00',3,4);
INSERT INTO tdigital.promocion VALUES (5,20,'De Sábado y Domingo antes de las 09:00',2,5);
commit;

----------------------------------------------------------------------------------------

TABLA  FUNCIONES

INSERT INTO tdigital.funcion VALUES (1,1,'Lunes',TO_DATE('2020-05-20 11:00:00', 'YYYY-MM-DD HH24:MI:SS'),1);
INSERT INTO tdigital.funcion VALUES (2,2,'Martes',TO_DATE('2020-06-10 12:00:00', 'YYYY-MM-DD HH24:MI:SS'),2);
INSERT INTO tdigital.funcion VALUES (3,3,'Sábado',TO_DATE('2020-07-25 18:00:00', 'YYYY-MM-DD HH24:MI:SS'),3);
INSERT INTO tdigital.funcion VALUES (4,1,'Domingo',TO_DATE('2020-05-20 20:00:00', 'YYYY-MM-DD HH24:MI:SS'),4);
commit;
--------------------------------------------------------------------------------------------

TABLA  PElICULAS
INSERT INTO tdigital.pelicula VALUES (1,'La mujer Fantástica','Una Mujer Fantástica','Drama','Español','N','Chilena',2017,'www.unamujerfantastica.cl','01:44:00',1,'Marina es una joven mujer transgénero que vive en Santiago, Chile que trabaja como cantante y camarera.',1,1);
INSERT INTO tdigital.pelicula VALUES (2,'Mi amigo Alexis','Mi amigo Alexis','Largometraje','Español','N','Chilena',2019,'www.miamigoalexis.cl','01:38:00',2,'Una serie de desventuras llevarán a Tito a conocer al mismísimo Alexis Sánchez y es ahí donde ambas historias se cruzan',2,2);
INSERT INTO tdigital.pelicula VALUES (3,'Mujeres Arriba','Mujeres Arriba','Comedia','Español','N','Chilena',2020,'www.mujeres arriba.cl','01:30:00',3,'La historia cuenta las aventuras de 3 amigas, Teresa (Loretto Bernal) la soltera, Maida (Natalia Valdebenito), la mamá salvaje y Consuelo (Alison Mandel), la novia perfeccionista.',3,3);
commit;

-------------------------------------------------------------------------------------------------------------------------------------------

TABLA CALIFICACION PELICULA
INSERT INTO tdigital.califi VALUES (1,'Apta todo público',1);
INSERT INTO tdigital.califi VALUES (2,'+ de 9 años',2);
INSERT INTO tdigital.califi VALUES (3,'+ de 15 años',3);
INSERT INTO tdigital.califi VALUES (4,'+ de 18 años',1);
commit;
----------------------------------------------------------------------------------------------------------------
TABLA CALIFICACION OPINION
INSERT INTO tdigital.caliopi VALUES (1,'Obra Maestra',1);
INSERT INTO tdigital.caliopi VALUES (2,'Muy Buena',2);
INSERT INTO tdigital.caliopi VALUES (3,'Buena',3);
INSERT INTO tdigital.caliopi VALUES (4,'Regular',1);
INSERT INTO tdigital.caliopi VALUES (5,'Mala',2);
commit;
--------------------------------------------------------------------------------------------------------------
TABLA DE LA OPINION
INSERT INTO tdigital.opinion VALUES (1,'Juan Silva',55,TO_DATE('2020-04-20 20:00:00', 'YYYY-MM-DD HH24:MI:SS'),1,'Me parecio muy larga',1,1,1);
INSERT INTO tdigital.opinion VALUES (2,'Sonia Paz',20,TO_DATE('2020-05-22 02:00:00', 'YYYY-MM-DD HH24:MI:SS'),2,'Excelente',2,2,2);
INSERT INTO tdigital.opinion VALUES (3,'Eduardo Castillo',30,TO_DATE('2020-08-20 12:00:00', 'YYYY-MM-DD HH24:MI:SS'),3,'Muy mala',3,3,3);
commit;
--------------------------------------------------------------------------------------------------------------------
TABLA SALA
INSERT INTO tdigital.sala VALUES (1,'Super',80,1,1,1);
INSERT INTO tdigital.sala VALUES (2,'Premiun',60,2,2,2);
INSERT INTO tdigital.sala VALUES (3,'Ultra',55,3,3,3);
commit;
----------------------------------------------------------------------------------------------------
TABLA  CINE
INSERT INTO tdigital.cine VALUES (1,'Hoys','La habana#34',29874563,1,1);
INSERT INTO tdigital.cine VALUES (2,'Monopolis','La esquina #32',56982260,2,2);
INSERT INTO tdigital.cine VALUES (3,'Maxs','La luna Azul#67',2988855,3,3);
commit;
---------------------------------------------------------------------------------------------------------------
TABLA REPARTO
INSERT INTO tdigital.reparto VALUES (1,'Daniela Vega','3 de Junio 1989',5,'S','N',1);
INSERT INTO tdigital.reparto VALUES (1,'Francisco Reyes','6 de Julio 1954',3,'S','N',2);
INSERT INTO tdigital.reparto VALUES (1,'Aline Küppenheim ','10 de Agosto 1969',3,'S','N',3);
commit;
-------------------------------------------------------------------------------------------------------------------
SELECT

select c.nombre,c.sala_idsala,s.nombre,s.cantbut
from tdigital.cine c
LEFT join tdigital.sala s
on c.idcine=s.idcine
ORDER BY s.idsala;

RESULTADOS: Nombre del cine,N° sala, nombre Sala y Cantidad de butacas.

NOMBRE                         SALA_IDSALA NOMBRE                  CANTBUT
------------------------------ ----------- -------------------- ----------
Hoys                                     1 Super                        80
Monopolis                                2 Premiun                      60
Maxs                                     3 Ultra                        55
Hoys                                     1 BLACK                        80
Hoys                                     1 Super Efectos                60
Hoys                                     1 Zoom                         55

6 filas seleccionadas. 

---------------------------------------------------------------------------------------
select s.nombre, s.cantbut, p.titulod,p.genero,p.duracion
from tdigital.sala s
LEFT join tdigital.pelicula p
on s.idpeli=p.id_pelicula
ORDER BY s.idpeli;

RESULTADOS:Nombre de la Sala, cant. butacas,Titulo Película,Género Película y su duración.

NOMBRE                  CANTBUT TITULOD                        GENERO                                             DURACION            
-------------------- ---------- ------------------------------ -------------------------------------------------- --------------------
Super                        80 La mujer Fantástica            Drama                                              01:44:00            
BLACK                        80 La mujer Fantástica            Drama                                              01:44:00            
Super Efectos                60 Mi amigo Alexis                Largometraje                                       01:38:00            
Premiun                      60 Mi amigo Alexis                Largometraje                                       01:38:00            
Zoom                         55 Mujeres Arriba                 Comedia                                            01:30:00            
Ultra                        55 Mujeres Arriba                 Comedia                                            01:30:00  

6 filas seleccionadas. 

-----------------------------------------------------------------------------------------------------------------------

select p.titulod,p.duracion,f.diasemana,f.horacom
from tdigital.pelicula p
LEFT join tdigital.funcion f
on p.funcion_idfuncion=f.idfuncion
ORDER BY p.funcion_idfuncion;

RESULTADO: título de la película, duración día de la semana y su hora.

TITULOD                        DURACION             DIASEMANA  HORACOM 
------------------------------ -------------------- ---------- --------
La mujer Fantástica            01:44:00             Lunes      20/05/20
Mi amigo Alexis                01:38:00             Martes     10/06/20
Mujeres Arriba                 01:30:00             Sábado     25/07/20

------------------------------------------------------------------------------------------------------------------------

select f.idpelicula,f.diasemana,f.horacom,pr."desc",pr.descrip
from tdigital.funcion f
LEFT join tdigital.promocion pr
on pr.idfunc=f.idfuncion
ORDER BY pr.idfunc;

RESULTADO:Id pelidula,día fecha hora  , su descuento y descripcion de la promoción si los tiene.

IDPELICULA DIASEMANA  HORACOM        desc DESCRIP                                           
---------- ---------- -------- ---------- --------------------------------------------------
         1 Lunes      20/05/20         50 De Lunes a Jueves antes de las 18:00              
         2 Martes     10/06/20         20 De Lunes a Jueves antes de las 14:00              
         3 Sábado     25/07/20         10 De Lunes a Jueves  antes de las 18:00             
         3 Sábado     25/07/20         20 De Sábado y Domingo antes de las 09:00            
         1 Domingo    20/05/20                                                              

--------------------------------------------------------------------------------------------------
select p.titulod,p.genero,r.nombre
from tdigital.pelicula p
LEFT join tdigital.reparto r
on p.id_pelicula=r.idpeli
ORDER BY p.id_pelicula;

RESULTADO:Nombre da la película , su género y reparto si es que se ingresó.

TITULOD                        GENERO                                             NOMBRE                        
------------------------------ -------------------------------------------------- ------------------------------
La mujer Fantástica            Drama                                              Daniela Vega                  
La mujer Fantástica            Drama                                              Francisco Reyes               
La mujer Fantástica            Drama                                              Aline Küppenheim              
Mi amigo Alexis                Largometraje                                                                     
Mujeres Arriba                 Comedia                                                                          

---------------------------------------------------------------------------------------------------------------------------

select p.titulod,p.idiomao,p.paiso,c.descrip
from tdigital.pelicula p
LEFT join tdigital.califi c
on p.id_pelicula=c.pelicula_id_pelicula
ORDER BY p.id_pelicula;
RESULTADO: LA pelicula su idioma , país y clasificasión.

TITULOD                        IDIOMAO              PAISO                DESCRIP                                           
------------------------------ -------------------- -------------------- --------------------------------------------------
La mujer Fantástica            Español              Chilena              Apta todo público                                 
La mujer Fantástica            Español              Chilena              + de 18 años                                      
Mi amigo Alexis                Español              Chilena              + de 9 años                                       
Mujeres Arriba                 Español              Chilena              + de 15 años                                      

-----------------------------------------------------------------------------------------------------------------------------------------------
select p.titulod,p.idiomao,o.nombre,o.edad,o.fecha,o.coment
from tdigital.pelicula p
LEFT join tdigital.opinion o
on p.id_pelicula=o.idpeli
ORDER BY p.id_pelicula;

RESULTADO:Nombre película,idioma,nobre persona que opinó edad fecha y lo que opinó.

TITULOD                        IDIOMAO              NOMBRE                               EDAD FECHA    COMENT                                                                          
------------------------------ -------------------- ------------------------------ ---------- -------- --------------------------------------------------------------------------------
La mujer Fantástica            Español              Juan Silva                             55 20/04/20 Me parecio muy larga                                                            
Mi amigo Alexis                Español              Sonia Paz                              20 22/05/20 Excelente                                                                       
Mujeres Arriba                 Español              Eduardo Castillo                       30 20/08/20 Muy mala   

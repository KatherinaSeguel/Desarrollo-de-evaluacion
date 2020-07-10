--------------------------------------------------------
-- Archivo creado  - viernes-julio-10-2020   
--------------------------------------------------------
--------------------------------------------------------
--  DDL for Table CALIFI
--------------------------------------------------------

  CREATE TABLE "TDIGITAL"."CALIFI" 
   (	"IDCALIF" NUMBER(*,0), 
	"DESCRIP" VARCHAR2(50 BYTE), 
	"PELICULA_ID_PELICULA" NUMBER(*,0)
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
REM INSERTING into TDIGITAL.CALIFI
SET DEFINE OFF;
Insert into TDIGITAL.CALIFI (IDCALIF,DESCRIP,PELICULA_ID_PELICULA) values ('1','Apta todo p�blico','1');
Insert into TDIGITAL.CALIFI (IDCALIF,DESCRIP,PELICULA_ID_PELICULA) values ('2','+ de 9 a�os','2');
Insert into TDIGITAL.CALIFI (IDCALIF,DESCRIP,PELICULA_ID_PELICULA) values ('3','+ de 15 a�os','3');
Insert into TDIGITAL.CALIFI (IDCALIF,DESCRIP,PELICULA_ID_PELICULA) values ('4','+ de 18 a�os','1');
--------------------------------------------------------
--  DDL for Index CALIFI_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "TDIGITAL"."CALIFI_PK" ON "TDIGITAL"."CALIFI" ("IDCALIF") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
--------------------------------------------------------
--  Constraints for Table CALIFI
--------------------------------------------------------

  ALTER TABLE "TDIGITAL"."CALIFI" ADD CONSTRAINT "CALIFI_PK" PRIMARY KEY ("IDCALIF")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM"  ENABLE;
  ALTER TABLE "TDIGITAL"."CALIFI" MODIFY ("PELICULA_ID_PELICULA" NOT NULL ENABLE);
  ALTER TABLE "TDIGITAL"."CALIFI" MODIFY ("IDCALIF" NOT NULL ENABLE);
--------------------------------------------------------
--  Ref Constraints for Table CALIFI
--------------------------------------------------------

  ALTER TABLE "TDIGITAL"."CALIFI" ADD CONSTRAINT "CALIFI_PELICULA_FK" FOREIGN KEY ("PELICULA_ID_PELICULA")
	  REFERENCES "TDIGITAL"."PELICULA" ("ID_PELICULA") ON DELETE CASCADE ENABLE;

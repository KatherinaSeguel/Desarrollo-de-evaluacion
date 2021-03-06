--------------------------------------------------------
-- Archivo creado  - viernes-julio-10-2020   
--------------------------------------------------------
--------------------------------------------------------
--  DDL for Table PROMOCION
--------------------------------------------------------

  CREATE TABLE "TDIGITAL"."PROMOCION" 
   (	"IDPROMO" NUMBER(*,0), 
	"desc" NUMBER, 
	"DESCRIP" VARCHAR2(50 BYTE), 
	"IDFUNC" NUMBER(*,0), 
	"FUNCION_IDFUNCION" NUMBER(*,0)
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
REM INSERTING into TDIGITAL.PROMOCION
SET DEFINE OFF;
Insert into TDIGITAL.PROMOCION (IDPROMO,"desc",DESCRIP,IDFUNC,FUNCION_IDFUNCION) values ('1','50','De Lunes a Jueves antes de las 18:00','1','1');
Insert into TDIGITAL.PROMOCION (IDPROMO,"desc",DESCRIP,IDFUNC,FUNCION_IDFUNCION) values ('2','20','De Lunes a Jueves antes de las 14:00','2','2');
Insert into TDIGITAL.PROMOCION (IDPROMO,"desc",DESCRIP,IDFUNC,FUNCION_IDFUNCION) values ('3','10','De Lunes a Jueves  antes de las 18:00','3','3');
Insert into TDIGITAL.PROMOCION (IDPROMO,"desc",DESCRIP,IDFUNC,FUNCION_IDFUNCION) values ('4','20','De S�bado y Domingo antes de las 09:00','3','4');
--------------------------------------------------------
--  DDL for Index PROMOCION_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "TDIGITAL"."PROMOCION_PK" ON "TDIGITAL"."PROMOCION" ("IDPROMO") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
--------------------------------------------------------
--  Constraints for Table PROMOCION
--------------------------------------------------------

  ALTER TABLE "TDIGITAL"."PROMOCION" ADD CONSTRAINT "PROMOCION_PK" PRIMARY KEY ("IDPROMO")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM"  ENABLE;
  ALTER TABLE "TDIGITAL"."PROMOCION" MODIFY ("FUNCION_IDFUNCION" NOT NULL ENABLE);
  ALTER TABLE "TDIGITAL"."PROMOCION" MODIFY ("IDFUNC" NOT NULL ENABLE);
  ALTER TABLE "TDIGITAL"."PROMOCION" MODIFY ("DESCRIP" NOT NULL ENABLE);
  ALTER TABLE "TDIGITAL"."PROMOCION" MODIFY ("desc" NOT NULL ENABLE);
  ALTER TABLE "TDIGITAL"."PROMOCION" MODIFY ("IDPROMO" NOT NULL ENABLE);
--------------------------------------------------------
--  Ref Constraints for Table PROMOCION
--------------------------------------------------------

  ALTER TABLE "TDIGITAL"."PROMOCION" ADD CONSTRAINT "PROMOCION_FUNCION_FK" FOREIGN KEY ("FUNCION_IDFUNCION")
	  REFERENCES "TDIGITAL"."FUNCION" ("IDFUNCION") ON DELETE CASCADE ENABLE;

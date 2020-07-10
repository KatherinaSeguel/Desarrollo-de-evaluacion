-- Generado por Oracle SQL Developer Data Modeler 20.2.0.167.1538
--   en:        2020-07-09 23:15:09 CLT
--   sitio:      Oracle Database 11g
--   tipo:      Oracle Database 11g



-- predefined type, no DDL - MDSYS.SDO_GEOMETRY

-- predefined type, no DDL - XMLTYPE

CREATE TABLE califi (
    idcalif  INTEGER NOT NULL,
    descrip  VARCHAR2(50)
);

ALTER TABLE califi ADD CONSTRAINT califi_pk PRIMARY KEY ( idcalif );

CREATE TABLE caliopi (
    idcali       INTEGER NOT NULL,
    descripcion  VARCHAR2(30) NOT NULL,
    idopi        INTEGER NOT NULL
);

ALTER TABLE caliopi ADD CONSTRAINT caliopi_pk PRIMARY KEY ( idcali );

CREATE TABLE cine (
    idcine       INTEGER NOT NULL,
    nombre       VARCHAR2(30) NOT NULL,
    direccion    VARCHAR2(30) NOT NULL,
    telefono     INTEGER NOT NULL,
    idpeli       INTEGER NOT NULL,
    sala_idsala  INTEGER NOT NULL
);

ALTER TABLE cine ADD CONSTRAINT cine_pk PRIMARY KEY ( idcine );

CREATE TABLE funcion (
    idfuncion          INTEGER NOT NULL,
    idpelicula         INTEGER NOT NULL,
    diasemana          VARCHAR2(10) NOT NULL,
    horacom            DATE NOT NULL,
    idsala             INTEGER NOT NULL,
    promocion_idpromo  INTEGER NOT NULL
);

ALTER TABLE funcion ADD CONSTRAINT funcion_pk PRIMARY KEY ( idfuncion );

CREATE TABLE opinion (
    idopini               INTEGER NOT NULL,
    nombre                VARCHAR2(30) NOT NULL,
    edad                  INTEGER NOT NULL,
    fecha                 DATE NOT NULL,
    calif                 INTEGER NOT NULL,
    coment                CLOB NOT NULL,
    pelicula_id_pelicula  INTEGER NOT NULL,
    idpeli                INTEGER NOT NULL,
    caliopi_idcali        INTEGER NOT NULL
);

ALTER TABLE opinion ADD CONSTRAINT opinion_pk PRIMARY KEY ( idopini );

CREATE TABLE peci (
    pelicula_id_pelicula  INTEGER NOT NULL,
    cine_idcine           INTEGER NOT NULL
);

ALTER TABLE peci ADD CONSTRAINT peci_pk PRIMARY KEY ( pelicula_id_pelicula,
                                                      cine_idcine );

CREATE TABLE pelicula (
    id_pelicula        INTEGER NOT NULL,
    titulod            VARCHAR2(30) NOT NULL,
    tituloo            VARCHAR2(30) NOT NULL,
    genero             VARCHAR2(50) NOT NULL,
    idiomao            VARCHAR2(20) NOT NULL,
    sutitulo           CHAR(1) NOT NULL,
    paiso              VARCHAR2(20) NOT NULL,
    anopruduc          INTEGER NOT NULL,
    urlweb             VARCHAR2(30) NOT NULL,
    duracion           VARCHAR2(20) NOT NULL,
    califica           INTEGER NOT NULL,
    resumen            CLOB,
    funcion_idfuncion  INTEGER NOT NULL,
    idopi              INTEGER NOT NULL,
    califi_idcalif     INTEGER NOT NULL
);

ALTER TABLE pelicula ADD CONSTRAINT pelicula_pk PRIMARY KEY ( id_pelicula );

CREATE TABLE pere (
    pelicula_id_pelicula  INTEGER NOT NULL,
    reparto_reparto_id    NUMBER NOT NULL
);

ALTER TABLE pere ADD CONSTRAINT pere_pk PRIMARY KEY ( pelicula_id_pelicula,
                                                      reparto_reparto_id );

CREATE TABLE pesala (
    pelicula_id_pelicula  INTEGER NOT NULL,
    sala_idsala           INTEGER NOT NULL
);

ALTER TABLE pesala ADD CONSTRAINT pesala_pk PRIMARY KEY ( pelicula_id_pelicula,
                                                          sala_idsala );

CREATE TABLE promocion (
    idpromo  INTEGER NOT NULL,
    "desc"   NUMBER NOT NULL,
    descrip  VARCHAR2(50) NOT NULL,
    idfunc   INTEGER NOT NULL
);

ALTER TABLE promocion ADD CONSTRAINT promocion_pk PRIMARY KEY ( idpromo );

CREATE TABLE reparto (
    idpeli      INTEGER NOT NULL,
    nombre      VARCHAR2(30) NOT NULL,
    nacio       VARCHAR2(30) NOT NULL,
    cantpeli    INTEGER NOT NULL,
    esactor     CHAR(1) NOT NULL,
    esdirec     CHAR(1) NOT NULL,
    reparto_id  NUMBER NOT NULL
);

ALTER TABLE reparto ADD CONSTRAINT reparto_pk PRIMARY KEY ( reparto_id );

CREATE TABLE sala (
    idsala             INTEGER NOT NULL,
    nombre             VARCHAR2(20) NOT NULL,
    cantbut            INTEGER NOT NULL,
    idcine             INTEGER NOT NULL,
    idpeli             INTEGER NOT NULL,
    funcion_idfuncion  INTEGER NOT NULL
);

ALTER TABLE sala ADD CONSTRAINT sala_pk PRIMARY KEY ( idsala );

ALTER TABLE cine
    ADD CONSTRAINT cine_sala_fk FOREIGN KEY ( sala_idsala )
        REFERENCES sala ( idsala );

ALTER TABLE funcion
    ADD CONSTRAINT funcion_promocion_fk FOREIGN KEY ( promocion_idpromo )
        REFERENCES promocion ( idpromo )
            ON DELETE CASCADE;

ALTER TABLE opinion
    ADD CONSTRAINT opinion_caliopi_fk FOREIGN KEY ( caliopi_idcali )
        REFERENCES caliopi ( idcali )
            ON DELETE CASCADE;

ALTER TABLE opinion
    ADD CONSTRAINT opinion_pelicula_fk FOREIGN KEY ( pelicula_id_pelicula )
        REFERENCES pelicula ( id_pelicula )
            ON DELETE CASCADE;

ALTER TABLE peci
    ADD CONSTRAINT peci_cine_fk FOREIGN KEY ( cine_idcine )
        REFERENCES cine ( idcine )
            ON DELETE CASCADE;

ALTER TABLE peci
    ADD CONSTRAINT peci_pelicula_fk FOREIGN KEY ( pelicula_id_pelicula )
        REFERENCES pelicula ( id_pelicula )
            ON DELETE CASCADE;

ALTER TABLE pelicula
    ADD CONSTRAINT pelicula_califi_fk FOREIGN KEY ( califi_idcalif )
        REFERENCES califi ( idcalif )
            ON DELETE CASCADE;

ALTER TABLE pelicula
    ADD CONSTRAINT pelicula_funcion_fk FOREIGN KEY ( funcion_idfuncion )
        REFERENCES funcion ( idfuncion )
            ON DELETE CASCADE;

ALTER TABLE pere
    ADD CONSTRAINT pere_pelicula_fk FOREIGN KEY ( pelicula_id_pelicula )
        REFERENCES pelicula ( id_pelicula )
            ON DELETE CASCADE;

ALTER TABLE pere
    ADD CONSTRAINT pere_reparto_fk FOREIGN KEY ( reparto_reparto_id )
        REFERENCES reparto ( reparto_id )
            ON DELETE CASCADE;

ALTER TABLE pesala
    ADD CONSTRAINT pesala_pelicula_fk FOREIGN KEY ( pelicula_id_pelicula )
        REFERENCES pelicula ( id_pelicula )
            ON DELETE CASCADE;

ALTER TABLE pesala
    ADD CONSTRAINT pesala_sala_fk FOREIGN KEY ( sala_idsala )
        REFERENCES sala ( idsala )
            ON DELETE CASCADE;

ALTER TABLE sala
    ADD CONSTRAINT sala_funcion_fk FOREIGN KEY ( funcion_idfuncion )
        REFERENCES funcion ( idfuncion )
            ON DELETE CASCADE;

CREATE SEQUENCE reparto_reparto_id_seq START WITH 1 NOCACHE ORDER;

CREATE OR REPLACE TRIGGER reparto_reparto_id_trg BEFORE
    INSERT ON reparto
    FOR EACH ROW
    WHEN ( new.reparto_id IS NULL )
BEGIN
    :new.reparto_id := reparto_reparto_id_seq.nextval;
END;
/



-- Informe de Resumen de Oracle SQL Developer Data Modeler: 
-- 
-- CREATE TABLE                            12
-- CREATE INDEX                             0
-- ALTER TABLE                             25
-- CREATE VIEW                              0
-- ALTER VIEW                               0
-- CREATE PACKAGE                           0
-- CREATE PACKAGE BODY                      0
-- CREATE PROCEDURE                         0
-- CREATE FUNCTION                          0
-- CREATE TRIGGER                           1
-- ALTER TRIGGER                            0
-- CREATE COLLECTION TYPE                   0
-- CREATE STRUCTURED TYPE                   0
-- CREATE STRUCTURED TYPE BODY              0
-- CREATE CLUSTER                           0
-- CREATE CONTEXT                           0
-- CREATE DATABASE                          0
-- CREATE DIMENSION                         0
-- CREATE DIRECTORY                         0
-- CREATE DISK GROUP                        0
-- CREATE ROLE                              0
-- CREATE ROLLBACK SEGMENT                  0
-- CREATE SEQUENCE                          1
-- CREATE MATERIALIZED VIEW                 0
-- CREATE MATERIALIZED VIEW LOG             0
-- CREATE SYNONYM                           0
-- CREATE TABLESPACE                        0
-- CREATE USER                              0
-- 
-- DROP TABLESPACE                          0
-- DROP DATABASE                            0
-- 
-- REDACTION POLICY                         0
-- 
-- ORDS DROP SCHEMA                         0
-- ORDS ENABLE SCHEMA                       0
-- ORDS ENABLE OBJECT                       0
-- 
-- ERRORS                                   0
-- WARNINGS                                 0

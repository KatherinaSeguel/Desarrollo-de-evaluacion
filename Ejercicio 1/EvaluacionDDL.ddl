-- Generado por Oracle SQL Developer Data Modeler 20.2.0.167.1538
--   en:        2020-07-08 22:25:01 CLT
--   sitio:      Oracle Database 11g
--   tipo:      Oracle Database 11g



-- predefined type, no DDL - MDSYS.SDO_GEOMETRY

-- predefined type, no DDL - XMLTYPE

CREATE TABLE empleado (
    idempleado      INTEGER NOT NULL,
    nombreempleado  VARCHAR2(50) NOT NULL,
    fechaingreso    DATE NOT NULL
);

ALTER TABLE empleado ADD CONSTRAINT empleado_pk PRIMARY KEY ( idempleado );

CREATE TABLE empres (
    empleado_idempleado            INTEGER NOT NULL,
    prestservicio_idprestservicio  INTEGER NOT NULL
);

ALTER TABLE empres ADD CONSTRAINT empres_pk PRIMARY KEY ( empleado_idempleado,
                                                          prestservicio_idprestservicio );

CREATE TABLE prestservicio (
    idprestservicio  INTEGER NOT NULL,
    idservicio       INTEGER NOT NULL,
    idempleado       INTEGER NOT NULL,
    idvehiculo       INTEGER NOT NULL,
    fecha            DATE NOT NULL
);

ALTER TABLE prestservicio ADD CONSTRAINT prestservicio_pk PRIMARY KEY ( idprestservicio );

CREATE TABLE serpre (
    servicio_idservicio            INTEGER NOT NULL,
    prestservicio_idprestservicio  INTEGER NOT NULL
);

ALTER TABLE serpre ADD CONSTRAINT serpre_pk PRIMARY KEY ( servicio_idservicio,
                                                          prestservicio_idprestservicio );

CREATE TABLE servicio (
    idservicio      INTEGER NOT NULL,
    nombreservicio  VARCHAR2(30) NOT NULL,
    valorservicio   INTEGER NOT NULL
);

ALTER TABLE servicio ADD CONSTRAINT servicio_pk PRIMARY KEY ( idservicio );

CREATE TABLE vehiculo (
    idvehiculo      INTEGER NOT NULL,
    marcavehiculo   VARCHAR2(30) NOT NULL,
    modelovehiculo  VARCHAR2(30)
);

ALTER TABLE vehiculo ADD CONSTRAINT vehiculo_pk PRIMARY KEY ( idvehiculo );

CREATE TABLE vehpre (
    vehiculo_idvehiculo            INTEGER NOT NULL,
    prestservicio_idprestservicio  INTEGER NOT NULL
);

ALTER TABLE vehpre ADD CONSTRAINT vehpre_pk PRIMARY KEY ( vehiculo_idvehiculo,
                                                          prestservicio_idprestservicio );

ALTER TABLE empres
    ADD CONSTRAINT empres_empleado_fk FOREIGN KEY ( empleado_idempleado )
        REFERENCES empleado ( idempleado )
            ON DELETE CASCADE;

ALTER TABLE empres
    ADD CONSTRAINT empres_prestservicio_fk FOREIGN KEY ( prestservicio_idprestservicio )
        REFERENCES prestservicio ( idprestservicio )
            ON DELETE CASCADE;

ALTER TABLE serpre
    ADD CONSTRAINT serpre_prestservicio_fk FOREIGN KEY ( prestservicio_idprestservicio )
        REFERENCES prestservicio ( idprestservicio )
            ON DELETE CASCADE;

ALTER TABLE serpre
    ADD CONSTRAINT serpre_servicio_fk FOREIGN KEY ( servicio_idservicio )
        REFERENCES servicio ( idservicio )
            ON DELETE CASCADE;

ALTER TABLE vehpre
    ADD CONSTRAINT vehpre_prestservicio_fk FOREIGN KEY ( prestservicio_idprestservicio )
        REFERENCES prestservicio ( idprestservicio );

ALTER TABLE vehpre
    ADD CONSTRAINT vehpre_vehiculo_fk FOREIGN KEY ( vehiculo_idvehiculo )
        REFERENCES vehiculo ( idvehiculo );



-- Informe de Resumen de Oracle SQL Developer Data Modeler: 
-- 
-- CREATE TABLE                             7
-- CREATE INDEX                             0
-- ALTER TABLE                             13
-- CREATE VIEW                              0
-- ALTER VIEW                               0
-- CREATE PACKAGE                           0
-- CREATE PACKAGE BODY                      0
-- CREATE PROCEDURE                         0
-- CREATE FUNCTION                          0
-- CREATE TRIGGER                           0
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
-- CREATE SEQUENCE                          0
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

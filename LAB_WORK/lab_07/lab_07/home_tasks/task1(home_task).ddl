-- Generated by Oracle SQL Developer Data Modeler 4.1.1.888
--   at:        2024-10-06 19:23:36 PKT
--   site:      Oracle Database 11g
--   type:      Oracle Database 11g




CREATE
  TABLE Exam_Administration
  (
    Admin_ID     INTEGER NOT NULL ,
    Exam_ID      INTEGER ,
    Professor_ID INTEGER ,
    Assistant_ID INTEGER ,
    Admin_Date   DATE ,
    Admin_Time   DATE ,
    Location     VARCHAR2
    --  ERROR: VARCHAR2 size not specified
    ,
    --  ERROR: Column name length exceeds maximum allowed length(30)
    Reporting_and_Analytics_Report_ID INTEGER NOT NULL ,
    --  ERROR: Column name length exceeds maximum allowed length(30)
    Reporting_and_Analytics_Exam_Administration_Admin_ID INTEGER NOT NULL ,
    --  ERROR: Column name length exceeds maximum allowed length(30)
    Grading_and_Evaluation_Grade_ID INTEGER NOT NULL ,
    --  ERROR: Column name length exceeds maximum allowed length(30)
    Grading_and_Evaluation_Exam_Administration_Admin_ID INTEGER NOT NULL ,
    Results_Publication_Result_ID                       INTEGER NOT NULL ,
    --  ERROR: Column name length exceeds maximum allowed length(30)
    Results_Publication_Exam_Administration_Admin_ID INTEGER NOT NULL
  ) ;
ALTER TABLE Exam_Administration ADD CONSTRAINT Exam_Administration_PK PRIMARY
KEY ( Admin_ID ) ;


CREATE
  TABLE Grading_and_Evaluation
  (
    Grade_ID   INTEGER NOT NULL ,
    Student_ID INTEGER ,
    Exam_ID    INTEGER ,
    Score FLOAT ,
    Comments VARCHAR2
    --  ERROR: VARCHAR2 size not specified
    ,
    Grading_Date                  DATE ,
    Results_Publication_Result_ID INTEGER NOT NULL ,
    Exam_Administration_Admin_ID  INTEGER NOT NULL ,
    --  ERROR: Column name length exceeds maximum allowed length(30)
    Results_Publication_Exam_Administration_Admin_ID INTEGER NOT NULL ,
    Results_Publication_Result_ID1                   INTEGER NOT NULL ,
    --  ERROR: Column name length exceeds maximum allowed length(30)
    Results_Publication_Exam_Administration_Admin_ID1 INTEGER NOT NULL ,
    Results_Publication_Result_ID2                    INTEGER NOT NULL ,
    --  ERROR: Column name length exceeds maximum allowed length(30)
    Results_Publication_Exam_Administration_Admin_ID2 INTEGER NOT NULL
  ) ;
CREATE UNIQUE INDEX Grading_and_Evaluation__IDX ON Grading_and_Evaluation
  (
    Results_Publication_Result_ID ASC ,
    Results_Publication_Exam_Administration_Admin_ID ASC
  )
  ;
ALTER TABLE Grading_and_Evaluation ADD CONSTRAINT Grading_and_Evaluation_PK
PRIMARY KEY ( Grade_ID, Exam_Administration_Admin_ID ) ;


CREATE
  TABLE Reporting_and_Analytics
  (
    Report_ID                     INTEGER NOT NULL ,
    Report_Type                   VARCHAR2 (80 BYTE) ,
    Generated_Date                DATE ,
    Details                       VARCHAR2 (80 BYTE) ,
    Admin_ID                      INTEGER ,
    Results_Publication_Result_ID INTEGER NOT NULL ,
    --  ERROR: Column name length exceeds maximum allowed length(30)
    Grading_and_Evaluation_Grade_ID INTEGER NOT NULL ,
    --  ERROR: Column name length exceeds maximum allowed length(30)
    Grading_and_Evaluation_Exam_Administration_Admin_ID INTEGER NOT NULL ,
    --  ERROR: Column name length exceeds maximum allowed length(30)
    Results_Publication_Exam_Administration_Admin_ID INTEGER NOT NULL ,
    Exam_Administration_Admin_ID                     INTEGER NOT NULL
  ) ;
CREATE UNIQUE INDEX Reporting_and_Analytics__IDX ON Reporting_and_Analytics
  (
    Results_Publication_Result_ID ASC ,
    Results_Publication_Exam_Administration_Admin_ID ASC
  )
  ;
CREATE UNIQUE INDEX Reporting_and_Analytics__IDXv1 ON Reporting_and_Analytics
  (
    Grading_and_Evaluation_Grade_ID ASC ,
    Grading_and_Evaluation_Exam_Administration_Admin_ID ASC
  )
  ;
ALTER TABLE Reporting_and_Analytics ADD CONSTRAINT Reporting_and_Analytics_PK
PRIMARY KEY ( Report_ID, Exam_Administration_Admin_ID ) ;


CREATE
  TABLE Results_Publication
  (
    Result_ID                    INTEGER NOT NULL ,
    Exam_ID                      INTEGER ,
    Student_ID                   INTEGER ,
    Result_Date                  DATE ,
    Published                    CHAR (1) ,
    Exam_Administration_Admin_ID INTEGER NOT NULL
  ) ;
ALTER TABLE Results_Publication ADD CONSTRAINT Results_Publication_PK PRIMARY
KEY ( Result_ID, Exam_Administration_Admin_ID ) ;


--  ERROR: FK name length exceeds maximum allowed length(30)
ALTER TABLE Exam_Administration ADD CONSTRAINT
Exam_Administration_Grading_and_Evaluation_FK FOREIGN KEY (
Grading_and_Evaluation_Grade_ID,
Grading_and_Evaluation_Exam_Administration_Admin_ID ) REFERENCES
Grading_and_Evaluation ( Grade_ID, Exam_Administration_Admin_ID ) ;

--  ERROR: FK name length exceeds maximum allowed length(30)
ALTER TABLE Exam_Administration ADD CONSTRAINT
Exam_Administration_Reporting_and_Analytics_FK FOREIGN KEY (
Reporting_and_Analytics_Report_ID,
Reporting_and_Analytics_Exam_Administration_Admin_ID ) REFERENCES
Reporting_and_Analytics ( Report_ID, Exam_Administration_Admin_ID ) ;

--  ERROR: FK name length exceeds maximum allowed length(30)
ALTER TABLE Exam_Administration ADD CONSTRAINT
Exam_Administration_Results_Publication_FK FOREIGN KEY (
Results_Publication_Result_ID, Results_Publication_Exam_Administration_Admin_ID
) REFERENCES Results_Publication ( Result_ID, Exam_Administration_Admin_ID ) ;

--  ERROR: FK name length exceeds maximum allowed length(30)
ALTER TABLE Grading_and_Evaluation ADD CONSTRAINT
Grading_and_Evaluation_Exam_Administration_FK FOREIGN KEY (
Exam_Administration_Admin_ID ) REFERENCES Exam_Administration ( Admin_ID ) ;

--  ERROR: FK name length exceeds maximum allowed length(30)
ALTER TABLE Grading_and_Evaluation ADD CONSTRAINT
Grading_and_Evaluation_Results_Publication_FK FOREIGN KEY (
Results_Publication_Result_ID, Results_Publication_Exam_Administration_Admin_ID
) REFERENCES Results_Publication ( Result_ID, Exam_Administration_Admin_ID ) ;

--  ERROR: FK name length exceeds maximum allowed length(30)
ALTER TABLE Grading_and_Evaluation ADD CONSTRAINT
Grading_and_Evaluation_Results_Publication_FKv1 FOREIGN KEY (
Results_Publication_Result_ID1,
Results_Publication_Exam_Administration_Admin_ID1 ) REFERENCES
Results_Publication ( Result_ID, Exam_Administration_Admin_ID ) ;

--  ERROR: FK name length exceeds maximum allowed length(30)
ALTER TABLE Grading_and_Evaluation ADD CONSTRAINT
Grading_and_Evaluation_Results_Publication_FKv2 FOREIGN KEY (
Results_Publication_Result_ID2,
Results_Publication_Exam_Administration_Admin_ID2 ) REFERENCES
Results_Publication ( Result_ID, Exam_Administration_Admin_ID ) ;

--  ERROR: FK name length exceeds maximum allowed length(30)
ALTER TABLE Reporting_and_Analytics ADD CONSTRAINT
Reporting_and_Analytics_Exam_Administration_FK FOREIGN KEY (
Exam_Administration_Admin_ID ) REFERENCES Exam_Administration ( Admin_ID ) ;

--  ERROR: FK name length exceeds maximum allowed length(30)
ALTER TABLE Reporting_and_Analytics ADD CONSTRAINT
Reporting_and_Analytics_Grading_and_Evaluation_FK FOREIGN KEY (
Grading_and_Evaluation_Grade_ID,
Grading_and_Evaluation_Exam_Administration_Admin_ID ) REFERENCES
Grading_and_Evaluation ( Grade_ID, Exam_Administration_Admin_ID ) ;

--  ERROR: FK name length exceeds maximum allowed length(30)
ALTER TABLE Reporting_and_Analytics ADD CONSTRAINT
Reporting_and_Analytics_Results_Publication_FK FOREIGN KEY (
Results_Publication_Result_ID, Results_Publication_Exam_Administration_Admin_ID
) REFERENCES Results_Publication ( Result_ID, Exam_Administration_Admin_ID ) ;

--  ERROR: FK name length exceeds maximum allowed length(30)
ALTER TABLE Results_Publication ADD CONSTRAINT
Results_Publication_Exam_Administration_FK FOREIGN KEY (
Exam_Administration_Admin_ID ) REFERENCES Exam_Administration ( Admin_ID ) ;


-- Oracle SQL Developer Data Modeler Summary Report: 
-- 
-- CREATE TABLE                             4
-- CREATE INDEX                             3
-- ALTER TABLE                             15
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
-- ERRORS                                  24
-- WARNINGS                                 0

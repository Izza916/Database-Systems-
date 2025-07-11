-- Generated by Oracle SQL Developer Data Modeler 4.1.1.888
--   at:        2024-10-06 22:07:17 PKT
--   site:      Oracle Database 11g
--   type:      Oracle Database 11g




CREATE TABLE Billing_and_Payments
  (
    Bill_ID     INTEGER NOT NULL ,
    Resident_ID INTEGER ,
    Plan_ID     INTEGER ,
    Billing_Amount FLOAT ,
    Payment_Date                 DATE ,
    Payment_Status               CHAR (1) ,
    Meal_Plans_Plan_ID           INTEGER ,
    Hostel_Residents_Resident_ID INTEGER ,
    --  ERROR: Column name length exceeds maximum allowed length(30)
    Hostel_Residents_Feedback_and_Complaints_Feedback_ID INTEGER
  ) ;
ALTER TABLE Billing_and_Payments ADD CONSTRAINT Billing_and_Payments_PK PRIMARY KEY ( Bill_ID ) ;


--  ERROR: Table name length exceeds maximum allowed length(30)
CREATE TABLE Dietary_Preferences_and_Allergies
  (
    Resident_ID         INTEGER NOT NULL ,
    Dietary_Restriction VARCHAR2
    --  ERROR: VARCHAR2 size not specified
    ,
    Allergy_Details VARCHAR2
    --  ERROR: VARCHAR2 size not specified
  ) ;
--  ERROR: PK name length exceeds maximum allowed length(30)
ALTER TABLE Dietary_Preferences_and_Allergies ADD CONSTRAINT Dietary_Preferences_and_Allergies_PK PRIMARY KEY ( Resident_ID ) ;


CREATE TABLE Feedback_and_Complaints
  (
    Feedback_ID    INTEGER NOT NULL ,
    Resident_ID    INTEGER ,
    Meal_Date      DATE ,
    Complaint_Type VARCHAR2
    --  ERROR: VARCHAR2 size not specified
    ,
    Feedback_Description VARCHAR2
    --  ERROR: VARCHAR2 size not specified
    ,
    Resolution_Status VARCHAR2
    --  ERROR: VARCHAR2 size not specified
  ) ;
ALTER TABLE Feedback_and_Complaints ADD CONSTRAINT Feedback_and_Complaints_PK PRIMARY KEY ( Feedback_ID ) ;


CREATE TABLE Guest_Meals
  (
    Guest_Meal_ID INTEGER NOT NULL ,
    Resident_ID   INTEGER ,
    Guest_Name    VARCHAR2
    --  ERROR: VARCHAR2 size not specified
    ,
    Meal_Booking_ID INTEGER ,
    Guest_Charge FLOAT
  ) ;
ALTER TABLE Guest_Meals ADD CONSTRAINT Guest_Meals_PK PRIMARY KEY ( Guest_Meal_ID ) ;


CREATE TABLE Hostel_Residents
  (
    Resident_ID INTEGER NOT NULL ,
    Hostel_ID   INTEGER NOT NULL ,
    First_Name  VARCHAR2
    --  ERROR: VARCHAR2 size not specified
    ,
    Last_Name VARCHAR2
    --  ERROR: VARCHAR2 size not specified
    ,
    Room_Number  INTEGER ,
    Contact_Info VARCHAR2
    --  ERROR: VARCHAR2 size not specified
    ,
    Meal_Plan_ID INTEGER ,
    --  ERROR: Column name length exceeds maximum allowed length(30)
    Dietary_Preferences_and_Allergies_Resident_ID INTEGER NOT NULL ,
    --  ERROR: Column name length exceeds maximum allowed length(30)
    Feedback_and_Complaints_Feedback_ID INTEGER NOT NULL ,
    Meal_Booking_Booking_ID             INTEGER NOT NULL ,
    Billing_and_Payments_Bill_ID        INTEGER NOT NULL ,
    --  ERROR: Column name length exceeds maximum allowed length(30)
    Dietary_Preferences_and_Allergies_Resident_ID1 INTEGER NOT NULL ,
    --  ERROR: Column name length exceeds maximum allowed length(30)
    Feedback_and_Complaints_Feedback_ID1 INTEGER NOT NULL ,
    --  ERROR: Column name length exceeds maximum allowed length(30)
    Feedback_and_Complaints_Feedback_ID2 INTEGER NOT NULL
  ) ;
CREATE UNIQUE INDEX Hostel_Residents__IDX ON Hostel_Residents
  (
    Dietary_Preferences_and_Allergies_Resident_ID ASC
  )
  ;
ALTER TABLE Hostel_Residents ADD CONSTRAINT Hostel_Residents_PK PRIMARY KEY ( Resident_ID, Feedback_and_Complaints_Feedback_ID ) ;


CREATE TABLE Inventory_Management
  (
    Inventory_ID    INTEGER NOT NULL ,
    Ingredient_Name VARCHAR2
    --  ERROR: VARCHAR2 size not specified
    ,
    Quantity VARCHAR2
    --  ERROR: VARCHAR2 size not specified
    ,
    Reorder_Level VARCHAR2
    --  ERROR: VARCHAR2 size not specified
    ,
    Supplier_Info VARCHAR2
    --  ERROR: VARCHAR2 size not specified
    ,
    Last_Order_Date DATE
  ) ;
ALTER TABLE Inventory_Management ADD CONSTRAINT Inventory_Management_PK PRIMARY KEY ( Inventory_ID ) ;


CREATE TABLE Meal_Booking
  (
    Booking_ID          INTEGER NOT NULL ,
    Resident_ID         INTEGER ,
    Plan_ID             INTEGER ,
    Meal_Date           DATE ,
    Dietary_Preferences VARCHAR2
    --  ERROR: VARCHAR2 size not specified
    ,
    Guest_Meal     CHAR (1) ,
    Booking_Status VARCHAR2
    --  ERROR: VARCHAR2 size not specified
    ,
    Hostel_Residents_Resident_ID INTEGER ,
    Meal_Plans_Plan_ID           INTEGER ,
    Guest_Meals_Guest_Meal_ID    INTEGER NOT NULL ,
    --  ERROR: Column name length exceeds maximum allowed length(30)
    Hostel_Residents_Feedback_and_Complaints_Feedback_ID INTEGER ,
    Guest_Meals_Guest_Meal_ID1                           INTEGER NOT NULL
  ) ;
CREATE UNIQUE INDEX Meal_Booking__IDX ON Meal_Booking
  (
    Guest_Meals_Guest_Meal_ID ASC
  )
  ;
ALTER TABLE Meal_Booking ADD CONSTRAINT Meal_Booking_PK PRIMARY KEY ( Booking_ID ) ;


CREATE TABLE Meal_Plans
  (
    Plan_ID   INTEGER NOT NULL ,
    Plan_Type VARCHAR2
    --  ERROR: VARCHAR2 size not specified
    ,
    Dietary_Preferences VARCHAR2
    --  ERROR: VARCHAR2 size not specified
    ,
    Plan_Start_Date               DATE ,
    Plan_End_Date                 DATE ,
    Hostel_Residents_Resident_ID  INTEGER NOT NULL ,
    Hostel_Residents_Feedback_ID  INTEGER NOT NULL ,
    Hostel_Residents_Resident_ID1 INTEGER NOT NULL ,
    --  ERROR: Column name length exceeds maximum allowed length(30)
    Hostel_Residents_Feedback_and_Complaints_Feedback_ID INTEGER NOT NULL ,
    Meal_Booking_Booking_ID                              INTEGER NOT NULL ,
    Billing_and_Payments_Bill_ID                         INTEGER NOT NULL
  ) ;
ALTER TABLE Meal_Plans ADD CONSTRAINT Meal_Plans_PK PRIMARY KEY ( Plan_ID ) ;


CREATE TABLE Mess_Operations
  (
    Operation_ID INTEGER NOT NULL ,
    Meal_Type    VARCHAR2
    --  ERROR: VARCHAR2 size not specified
    ,
    Meal_Date   DATE ,
    Start_Time  DATE ,
    End_Time    DATE ,
    Dining_Area VARCHAR2
    --  ERROR: VARCHAR2 size not specified
    ,
    Meal_Plans_Plan_ID INTEGER NOT NULL ,
    --  ERROR: Column name length exceeds maximum allowed length(30)
    Inventory_Management_Inventory_ID INTEGER NOT NULL ,
    --  ERROR: Column name length exceeds maximum allowed length(30)
    Inventory_Management_Inventory_ID1 INTEGER NOT NULL ,
    --  ERROR: Column name length exceeds maximum allowed length(30)
    Feedback_and_Complaints_Feedback_ID INTEGER NOT NULL
  ) ;
CREATE UNIQUE INDEX Mess_Operations__IDX ON Mess_Operations
  (
    Inventory_Management_Inventory_ID ASC
  )
  ;
ALTER TABLE Mess_Operations ADD CONSTRAINT Mess_Operations_PK PRIMARY KEY ( Operation_ID ) ;


CREATE TABLE Reports_and_Analytics
  (
    Report_ID   INTEGER NOT NULL ,
    Report_Type VARCHAR2
    --  ERROR: VARCHAR2 size not specified
    ,
    Generated_Date DATE ,
    Details        VARCHAR2
    --  ERROR: VARCHAR2 size not specified
    ,
    --  ERROR: Column name length exceeds maximum allowed length(30)
    Feedback_and_Complaints_Feedback_ID INTEGER ,
    Billing_and_Payments_Bill_ID        INTEGER ,
    Meal_Plans_Plan_ID                  INTEGER
  ) ;
ALTER TABLE Reports_and_Analytics ADD CONSTRAINT Reports_and_Analytics_PK PRIMARY KEY ( Report_ID ) ;


--  ERROR: FK name length exceeds maximum allowed length(30)
ALTER TABLE Billing_and_Payments ADD CONSTRAINT Billing_and_Payments_Hostel_Residents_FK FOREIGN KEY ( Hostel_Residents_Resident_ID, Hostel_Residents_Feedback_and_Complaints_Feedback_ID ) REFERENCES Hostel_Residents ( Resident_ID, Feedback_and_Complaints_Feedback_ID ) ;

--  ERROR: FK name length exceeds maximum allowed length(30)
ALTER TABLE Billing_and_Payments ADD CONSTRAINT Billing_and_Payments_Meal_Plans_FK FOREIGN KEY ( Meal_Plans_Plan_ID ) REFERENCES Meal_Plans ( Plan_ID ) ;

--  ERROR: FK name length exceeds maximum allowed length(30)
ALTER TABLE Hostel_Residents ADD CONSTRAINT Hostel_Residents_Billing_and_Payments_FK FOREIGN KEY ( Billing_and_Payments_Bill_ID ) REFERENCES Billing_and_Payments ( Bill_ID ) ;

--  ERROR: FK name length exceeds maximum allowed length(30)
ALTER TABLE Hostel_Residents ADD CONSTRAINT Hostel_Residents_Dietary_Preferences_and_Allergies_FK FOREIGN KEY ( Dietary_Preferences_and_Allergies_Resident_ID ) REFERENCES Dietary_Preferences_and_Allergies ( Resident_ID ) ;

--  ERROR: FK name length exceeds maximum allowed length(30)
ALTER TABLE Hostel_Residents ADD CONSTRAINT Hostel_Residents_Dietary_Preferences_and_Allergies_FKv1 FOREIGN KEY ( Dietary_Preferences_and_Allergies_Resident_ID1 ) REFERENCES Dietary_Preferences_and_Allergies ( Resident_ID ) ;

--  ERROR: FK name length exceeds maximum allowed length(30)
ALTER TABLE Hostel_Residents ADD CONSTRAINT Hostel_Residents_Feedback_and_Complaints_FK FOREIGN KEY ( Feedback_and_Complaints_Feedback_ID ) REFERENCES Feedback_and_Complaints ( Feedback_ID ) ;

--  ERROR: FK name length exceeds maximum allowed length(30)
ALTER TABLE Hostel_Residents ADD CONSTRAINT Hostel_Residents_Feedback_and_Complaints_FKv1 FOREIGN KEY ( Feedback_and_Complaints_Feedback_ID1 ) REFERENCES Feedback_and_Complaints ( Feedback_ID ) ;

--  ERROR: FK name length exceeds maximum allowed length(30)
ALTER TABLE Hostel_Residents ADD CONSTRAINT Hostel_Residents_Feedback_and_Complaints_FKv2 FOREIGN KEY ( Feedback_and_Complaints_Feedback_ID2 ) REFERENCES Feedback_and_Complaints ( Feedback_ID ) ;

--  ERROR: FK name length exceeds maximum allowed length(30)
ALTER TABLE Hostel_Residents ADD CONSTRAINT Hostel_Residents_Meal_Booking_FK FOREIGN KEY ( Meal_Booking_Booking_ID ) REFERENCES Meal_Booking ( Booking_ID ) ;

ALTER TABLE Meal_Booking ADD CONSTRAINT Meal_Booking_Guest_Meals_FK FOREIGN KEY ( Guest_Meals_Guest_Meal_ID ) REFERENCES Guest_Meals ( Guest_Meal_ID ) ;

ALTER TABLE Meal_Booking ADD CONSTRAINT Meal_Booking_Guest_Meals_FKv1 FOREIGN KEY ( Guest_Meals_Guest_Meal_ID1 ) REFERENCES Guest_Meals ( Guest_Meal_ID ) ;

--  ERROR: FK name length exceeds maximum allowed length(30)
ALTER TABLE Meal_Booking ADD CONSTRAINT Meal_Booking_Hostel_Residents_FK FOREIGN KEY ( Hostel_Residents_Resident_ID, Hostel_Residents_Feedback_and_Complaints_Feedback_ID ) REFERENCES Hostel_Residents ( Resident_ID, Feedback_and_Complaints_Feedback_ID ) ;

ALTER TABLE Meal_Booking ADD CONSTRAINT Meal_Booking_Meal_Plans_FK FOREIGN KEY ( Meal_Plans_Plan_ID ) REFERENCES Meal_Plans ( Plan_ID ) ;

--  ERROR: FK name length exceeds maximum allowed length(30)
ALTER TABLE Meal_Plans ADD CONSTRAINT Meal_Plans_Billing_and_Payments_FK FOREIGN KEY ( Billing_and_Payments_Bill_ID ) REFERENCES Billing_and_Payments ( Bill_ID ) ;

ALTER TABLE Meal_Plans ADD CONSTRAINT Meal_Plans_Hostel_Residents_FK FOREIGN KEY ( Hostel_Residents_Resident_ID, Hostel_Residents_Feedback_ID ) REFERENCES Hostel_Residents ( Resident_ID, Feedback_and_Complaints_Feedback_ID ) ;

--  ERROR: FK name length exceeds maximum allowed length(30)
ALTER TABLE Meal_Plans ADD CONSTRAINT Meal_Plans_Hostel_Residents_FKv1 FOREIGN KEY ( Hostel_Residents_Resident_ID1, Hostel_Residents_Feedback_and_Complaints_Feedback_ID ) REFERENCES Hostel_Residents ( Resident_ID, Feedback_and_Complaints_Feedback_ID ) ;

ALTER TABLE Meal_Plans ADD CONSTRAINT Meal_Plans_Meal_Booking_FK FOREIGN KEY ( Meal_Booking_Booking_ID ) REFERENCES Meal_Booking ( Booking_ID ) ;

--  ERROR: FK name length exceeds maximum allowed length(30)
ALTER TABLE Mess_Operations ADD CONSTRAINT Mess_Operations_Feedback_and_Complaints_FK FOREIGN KEY ( Feedback_and_Complaints_Feedback_ID ) REFERENCES Feedback_and_Complaints ( Feedback_ID ) ;

--  ERROR: FK name length exceeds maximum allowed length(30)
ALTER TABLE Mess_Operations ADD CONSTRAINT Mess_Operations_Inventory_Management_FK FOREIGN KEY ( Inventory_Management_Inventory_ID ) REFERENCES Inventory_Management ( Inventory_ID ) ;

--  ERROR: FK name length exceeds maximum allowed length(30)
ALTER TABLE Mess_Operations ADD CONSTRAINT Mess_Operations_Inventory_Management_FKv1 FOREIGN KEY ( Inventory_Management_Inventory_ID1 ) REFERENCES Inventory_Management ( Inventory_ID ) ;

ALTER TABLE Mess_Operations ADD CONSTRAINT Mess_Operations_Meal_Plans_FK FOREIGN KEY ( Meal_Plans_Plan_ID ) REFERENCES Meal_Plans ( Plan_ID ) ;

--  ERROR: FK name length exceeds maximum allowed length(30)
ALTER TABLE Reports_and_Analytics ADD CONSTRAINT Reports_and_Analytics_Billing_and_Payments_FK FOREIGN KEY ( Billing_and_Payments_Bill_ID ) REFERENCES Billing_and_Payments ( Bill_ID ) ;

--  ERROR: FK name length exceeds maximum allowed length(30)
ALTER TABLE Reports_and_Analytics ADD CONSTRAINT Reports_and_Analytics_Feedback_and_Complaints_FK FOREIGN KEY ( Feedback_and_Complaints_Feedback_ID ) REFERENCES Feedback_and_Complaints ( Feedback_ID ) ;

--  ERROR: FK name length exceeds maximum allowed length(30)
ALTER TABLE Reports_and_Analytics ADD CONSTRAINT Reports_and_Analytics_Meal_Plans_FK FOREIGN KEY ( Meal_Plans_Plan_ID ) REFERENCES Meal_Plans ( Plan_ID ) ;


-- Oracle SQL Developer Data Modeler Summary Report: 
-- 
-- CREATE TABLE                            10
-- CREATE INDEX                             3
-- ALTER TABLE                             34
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
-- ERRORS                                  53
-- WARNINGS                                 0

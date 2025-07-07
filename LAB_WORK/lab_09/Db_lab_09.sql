--======================= DML Trigger for Enforcing Referential Integrity
CREATE TABLE parent_table (
    parent_id NUMBER PRIMARY KEY,
    parent_data VARCHAR2(100)
);

CREATE TABLE child_table (
    child_id NUMBER PRIMARY KEY,
    parent_id NUMBER,
    child_data VARCHAR2(100),
    CONSTRAINT fk_parent FOREIGN KEY (parent_id) REFERENCES parent_table(parent_id)
);

CREATE OR REPLACE TRIGGER trg_referential_integrity
BEFORE INSERT OR UPDATE ON child_table
FOR EACH ROW
DECLARE
    v_exists NUMBER;
BEGIN
    SELECT COUNT(*) INTO v_exists FROM parent_table WHERE parent_id = :NEW.parent_id;
    IF v_exists = 0 THEN
        RAISE_APPLICATION_ERROR(-20001, 'Referential integrity violated: Parent record not found.');
    END IF;
END;
/
--==========DDL trigger that logs all schema changes (e.g., table creations, modifications, and drops) in a dedicated audit table.
CREATE TABLE schema_audit (
    ddl_date       TIMESTAMP,
    ddl_user       VARCHAR2(30),
    object_created VARCHAR2(30),
    object_name    VARCHAR2(30),
    ddl_operation  VARCHAR2(30)
);

CREATE OR REPLACE TRIGGER log_schema_changes
AFTER DDL ON SCHEMA
BEGIN
    INSERT INTO schema_audit (ddl_date, ddl_user, object_created, object_name, ddl_operation)
    VALUES (
        SYSTIMESTAMP,                                 
        SYS_CONTEXT('USERENV', 'CURRENT_USER'),    
        ORA_DICT_OBJ_TYPE,                          
        ORA_DICT_OBJ_NAME,                           
        ORA_SYSEVENT                                  
    );
END;
/

CREATE TABLE test_table (
    id NUMBER PRIMARY KEY,
    name VARCHAR2(50)
);
ALTER TABLE test_table ADD (age NUMBER);
DROP TABLE test_table;
SELECT * FROM schema_audit;


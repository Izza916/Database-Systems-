--==================== Task 1: DML Trigger Task:Create a DML trigger that logs changes to a specific table when records are inserted, updated, or deleted.==========================================================================================================================

--=========================• Create a DML trigger that enforces a referential integrity constraint between two tables when inserting or updating records.
--=========================• Create a DML trigger that automatically updates a &quot;last_modified&quot; timestamp when a record is updated in a table.

CREATE TABLE audit_log (
    action_type VARCHAR2(10),
    changed_by VARCHAR2(30),
    change_date DATE,
    table_name VARCHAR2(30),
    old_value VARCHAR2(100),
    new_value VARCHAR2(100)
);
CREATE OR REPLACE TRIGGER trg_log_changes
AFTER INSERT OR UPDATE OR DELETE ON employees
FOR EACH ROW
BEGIN
    IF INSERTING THEN
        INSERT INTO audit_log (action_type, changed_by, change_date, table_name, new_value)
        VALUES ('INSERT', USER, SYSDATE, 'employees', :NEW.employee_name);
    ELSIF UPDATING THEN
        INSERT INTO audit_log (action_type, changed_by, change_date, table_name, old_value, new_value)
        VALUES ('UPDATE', USER, SYSDATE, 'employees', :OLD.employee_name, :NEW.employee_name);
    ELSIF DELETING THEN
        INSERT INTO audit_log (action_type, changed_by, change_date, table_name, old_value)
        VALUES ('DELETE', USER, SYSDATE, 'employees', :OLD.employee_name);
    END IF;
END;
/

CREATE TABLE parent_table (
    parent_id NUMBER PRIMARY KEY,
    other_data VARCHAR2(50)
);
CREATE TABLE child_table (
    child_id NUMBER PRIMARY KEY,
    parent_id NUMBER,  
    other_data VARCHAR2(50)
);
CREATE OR REPLACE TRIGGER trg_enforce_referential_integrity
BEFORE INSERT OR UPDATE ON child_table
FOR EACH ROW
DECLARE
    v_count INTEGER;
BEGIN
    SELECT COUNT(*) INTO v_count FROM parent_table WHERE parent_id = :NEW.parent_id;
    IF v_count = 0 THEN
        RAISE_APPLICATION_ERROR(-20001, 'Parent ID not found in parent_table');
    END IF;
END;
/

CREATE OR REPLACE TRIGGER trg_update_last_modified
BEFORE UPDATE ON employees
FOR EACH ROW
BEGIN
    :NEW.last_modified := SYSDATE;
END;
/

--==============================================Task 2  DDL Trigger Tasks:==========================================================

--========================• Create a DDL trigger that logs all schema changes (e.g., table creations, modifications, and drops) in a dedicated audit table.
--========================• Create a DDL trigger that prohibits any user from altering or dropping a specific critical table.
--========================• Create a DDL trigger that prevents the creation of new tables with a specific naming pattern.

CREATE TABLE schema_audit_log (
    ddl_action VARCHAR2(30),
    ddl_user VARCHAR2(30),
    ddl_date DATE,
    object_name VARCHAR2(30),
    object_type VARCHAR2(30)
);
CREATE OR REPLACE TRIGGER trg_log_schema_changes
AFTER DDL ON SCHEMA
BEGIN
    INSERT INTO schema_audit_log (ddl_action, ddl_user, ddl_date, object_name, object_type)
    VALUES (ora_sysevent, sys_context('USERENV', 'CURRENT_USER'), SYSDATE, ora_dict_obj_name, ora_dict_obj_type);
END;
/

CREATE OR REPLACE TRIGGER trg_protect_employees_table
BEFORE DROP OR ALTER ON SCHEMA
BEGIN
    IF ora_dict_obj_name = 'EMPLOYEES' THEN
        RAISE_APPLICATION_ERROR(-20002, 'Altering or dropping the employees table is not allowed.');
    END IF;
END;
/

CREATE OR REPLACE TRIGGER trg_prevent_temp_table
BEFORE CREATE ON SCHEMA
BEGIN
    IF ora_dict_obj_type = 'TABLE' AND ora_dict_obj_name LIKE 'TEMP_%' THEN
        RAISE_APPLICATION_ERROR(-20003, 'Creating tables with names starting with "temp_" is not allowed.');
    END IF;
END;
/

--===================================Task 3: System/Database Trigger Task:================================================

--=====================================• Create a system trigger that captures information when a user logs in.
--=====================================• Create a system trigger that sends an email notification to the DBA whenever a user with specific privileges logs in.
--=====================================• Create a system trigger that automatically sets the session time zone for all users upon login.
CREATE TABLE login_audit (
    user_name VARCHAR2(30),
    login_date DATE,
    login_time VARCHAR2(10)
);
CREATE OR REPLACE TRIGGER trg_login_audit
AFTER LOGON ON DATABASE
BEGIN
    INSERT INTO login_audit (user_name, login_date, login_time)
    VALUES (USER, SYSDATE, TO_CHAR(SYSDATE, 'HH24:MI:SS'));
END;
/

CREATE OR REPLACE TRIGGER trg_privileged_user_login
AFTER LOGON ON DATABASE
BEGIN
    IF USER IN ('DBA_USER1', 'DBA_USER2') THEN
        UTL_MAIL.SEND(
            sender => 'admin@yourdomain.com',
            recipient => 'dba@yourdomain.com',
            subject => 'Privileged User Login',
            message => 'User ' || USER || ' has logged in.'
        );
    END IF;
END;
/

CREATE OR REPLACE TRIGGER trg_set_timezone
AFTER LOGON ON DATABASE
BEGIN
    EXECUTE IMMEDIATE 'ALTER SESSION SET TIME_ZONE = ''UTC''';
END;
/

--=======================================Task 4: Instead of Trigger Task==============================================

--========================•  trigger for a view that allows inserting data into multiple tables when an insert operation is performed on the view
--========================•  trigger for a view that allows inserting data into multiple tables when an insert operation is performed on the view
--========================•  trigger for a view that allows users to update records in a way that calculates and updates a computed column.
--========================•  trigger for a view that allows users to insert records into multiple related tables through a single view.

CREATE TABLE superheroes (
    sh_id NUMBER PRIMARY KEY,
    sh_name VARCHAR2(100)
);
CREATE TABLE subject (
    subject_id NUMBER PRIMARY KEY,
    subject_name VARCHAR2(100)
);
CREATE TABLE sales (
    sale_id NUMBER PRIMARY KEY,
    quantity NUMBER,
    unit_price NUMBER
);
CREATE TABLE orders (
    order_id NUMBER PRIMARY KEY,
    customer_id NUMBER,
    order_date DATE
);
CREATE TABLE order_items (
    order_item_id NUMBER PRIMARY KEY,
    order_id NUMBER,
    product_id NUMBER,
    quantity NUMBER,
    price NUMBER,
    FOREIGN KEY (order_id) REFERENCES orders(order_id)
);

CREATE VIEW v_superhero_subject AS
SELECT sh_name, subject_name
FROM superheroes, subject
WHERE superheroes.sh_id = subject.subject_id;

CREATE VIEW v_sales AS
SELECT sale_id, quantity, unit_price
FROM sales;

CREATE VIEW v_order_summary AS
SELECT order_id, customer_id, order_date, product_id, quantity, price
FROM orders, order_items
WHERE orders.order_id = order_items.order_id;

CREATE OR REPLACE TRIGGER trg_instead_of_insert
INSTEAD OF INSERT ON v_superhero_subject
FOR EACH ROW
BEGIN
    INSERT INTO superheroes (sh_name) 
    VALUES (:NEW.sh_name);

    INSERT INTO subject (subject_name) 
    VALUES (:NEW.subject_name);
END;
/

CREATE OR REPLACE TRIGGER trg_instead_of_update
INSTEAD OF UPDATE ON v_sales
FOR EACH ROW
BEGIN

    UPDATE sales
    SET quantity = :NEW.quantity,
        unit_price = :NEW.unit_price
    WHERE sale_id = :OLD.sale_id;
END;
/

CREATE OR REPLACE TRIGGER trg_instead_of_order_insert
INSTEAD OF INSERT ON v_order_summary
FOR EACH ROW
BEGIN
    INSERT INTO orders (order_id, customer_id, order_date)
    VALUES (:NEW.order_id, :NEW.customer_id, :NEW.order_date);

    INSERT INTO order_items (order_id, product_id, quantity, price)
    VALUES (:NEW.order_id, :NEW.product_id, :NEW.quantity, :NEW.price);
END;
/


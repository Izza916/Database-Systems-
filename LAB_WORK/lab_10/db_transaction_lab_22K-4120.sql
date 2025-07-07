-------------------------Class Task:
CREATE TABLE n_product ( product_id INT PRIMARY KEY, product_name VARCHAR(100), price DECIMAL(10, 2));
CREATE TABLE n_inventory ( product_id INT PRIMARY KEY, quantity INT, FOREIGN KEY (product_id) REFERENCES product(product_id));

INSERT INTO n_product (product_id, product_name, price) VALUES (201, 'Gadget_X', 99.99);
INSERT INTO n_inventory (product_id, quantity) VALUES (201, 100);
SAVEPOINT inventory_added;
UPDATE inventory SET quantity = quantity - 120 WHERE product_id = 201;
DECLARE
    current_quantity INT;
BEGIN
    SELECT quantity INTO current_quantity FROM inventory WHERE product_id = 201;

    IF current_quantity < 0 THEN
        ROLLBACK TO inventory_added;
        DBMS_OUTPUT.PUT_LINE('Inventory rollback performed due to negative quantity');
    ELSE
        COMMIT;
        DBMS_OUTPUT.PUT_LINE('Inventory updated successfully');
    END IF;
END;
/
--===========================================================Task1 :============================================================
--1. Create a new table named product_inventory with columns for product_id, product_name, stock,
--and price. Insert three different product records with initial stock values. Without committing the
--transaction, reduce the stock of one of the products and create a savepoint named stock_update.

CREATE TABLE product_inventory (product_id NUMBER PRIMARY KEY, product_name VARCHAR2(50), stock NUMBER, price NUMBER);

INSERT INTO product_inventory (product_id, product_name, stock, price) VALUES (1, 'Laptop', 50, 1000);
INSERT INTO product_inventory (product_id, product_name, stock, price) VALUES (2, 'Phone', 100, 500);
INSERT INTO product_inventory (product_id, product_name, stock, price) VALUES (3, 'Tablet', 75, 300);

UPDATE product_inventory SET stock = stock - 5 WHERE product_id = 1;
SAVEPOINT stock_update;

SELECT * FROM product_inventory;

SELECT product_name, stock FROM product_inventory WHERE product_id = 1;

ROLLBACK TO SAVEPOINT stock_update;
SELECT product_name, stock FROM product_inventory WHERE product_id = 1;

--==============2 In the employee table, add a new employee with a salary. Then, increase their salary by 10%, set
--===============a savepoint named salary_increase, and then further increase it by another 5%. Rollback to the
--===============salary_increase savepoint.


CREATE TABLE employee_izza AS SELECT * FROM HR.EMPLOYEES;
SELECT * FROM employee_izza;

INSERT INTO employee_izza (EMPLOYEE_ID, FIRST_NAME, LAST_NAME, EMAIL, HIRE_DATE, JOB_ID, SALARY) VALUES (999, 'John', 'Doe', 'JOHN.DOE@COMPANY.COM', SYSDATE, 'IT_PROG', 5000);
SELECT EMPLOYEE_ID, FIRST_NAME, LAST_NAME, SALARY FROM employee_izza WHERE EMPLOYEE_ID = 999;

COMMIT; 
SET TRANSACTION NAME 'salary_update';

UPDATE employee_izza SET SALARY = SALARY * 1.1 WHERE EMPLOYEE_ID = 999;
SAVEPOINT salary_increase;

UPDATE employee_izza SET SALARY = SALARY * 1.05 WHERE EMPLOYEE_ID = 999;
SELECT FIRST_NAME, LAST_NAME, SALARY FROM employee_izza WHERE EMPLOYEE_ID = 999;

ROLLBACK TO SAVEPOINT salary_increase;
SELECT FIRST_NAME, LAST_NAME, SALARY FROM employee_izza WHERE EMPLOYEE_ID = 999;
COMMIT;

SELECT FIRST_NAME, LAST_NAME, SALARY FROM employee_izza WHERE EMPLOYEE_ID = 999;


--================3. Use the customer and orders tables. Insert a new customer into the customer table. Then, insert an
--==============order for this customer in the orders table. Use a transaction control to ensure that both the
--==============customer and order are inserted only if both statements are successful; otherwise, roll back the
--==============changes.

CREATE TABLE customer (customer_id NUMBER PRIMARY KEY, customer_name VARCHAR2(50), balance NUMBER );
CREATE TABLE orders ( order_id NUMBER PRIMARY KEY, customer_id NUMBER REFERENCES customer(customer_id), amount NUMBER );

INSERT INTO customer (customer_id, customer_name, balance) VALUES (1, 'Jane Smith', 1000);
SAVEPOINT customer_added;

INSERT INTO orders (order_id, customer_id, amount) VALUES (101, 1, 200);
UPDATE customer SET balance = balance - 200 WHERE customer_id = 1;
SAVEPOINT order_added;

SELECT * FROM customer WHERE customer_id = 1;
SELECT * FROM orders WHERE order_id = 101;

DECLARE balance_check NUMBER;
BEGIN
    SELECT balance INTO balance_check FROM customer WHERE customer_id = 1;
    IF balance_check < 0 THEN
        ROLLBACK TO SAVEPOINT customer_added;
    ELSE
        COMMIT;
    END IF;
END;

SELECT * FROM customer;
SELECT * FROM orders;

--===========================================4. Enable AUTOCOMMIT mode in your SQL environment. Insert a row in the sales table with
--===========================================sales_id, customer_id, and amount. After the insertion, check if the row has been committed
--============================================automatically. Disable AUTOCOMMIT afterward.

CREATE TABLE sales (sales_id NUMBER PRIMARY KEY, customer_id NUMBER REFERENCES customer(customer_id), amount NUMBER);

SET AUTOCOMMIT ON;

INSERT INTO sales (sales_id, customer_id, amount) VALUES (1, 1, 150);

SELECT * FROM sales;

SET AUTOCOMMIT OFF;

SELECT * FROM sales WHERE sales_id = 1;


--============================5. Using the transactions table, simulate a transaction where multiple debits and credits are made on
--============================an account. Set multiple savepoints after each debit or credit operation, and then rollback to a
--============================specific savepoint to undo one of the operations.

CREATE TABLE transactions (transaction_id NUMBER PRIMARY KEY, account_id NUMBER NOT NULL, transaction_type VARCHAR2(10) CHECK (transaction_type IN ('debit', 'credit')), amount NUMBER NOT NULL,                  
    transaction_date DATE DEFAULT SYSDATE    
);

CREATE SEQUENCE transactions_seq START WITH 1 INCREMENT BY 1;

INSERT INTO transactions (transaction_id, account_id, transaction_type, amount) VALUES (transactions_seq.NEXTVAL, 1, 'debit', 100);
SAVEPOINT transaction_1;  

INSERT INTO transactions (transaction_id, account_id, transaction_type, amount) VALUES (transactions_seq.NEXTVAL, 1, 'credit', 200);
SAVEPOINT transaction_2;  

INSERT INTO transactions (transaction_id, account_id, transaction_type, amount) VALUES (transactions_seq.NEXTVAL, 1, 'debit', 50);
SAVEPOINT transaction_3; 

SELECT * FROM transactions;

ROLLBACK TO SAVEPOINT transaction_2;

SELECT * FROM transactions;

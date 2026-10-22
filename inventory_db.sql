-- step 6: create the INVENTORY table
CREATE TABLE INVENTORY (
    item_id INT PRIMARY KEY NOT NULL,
    item_name VARCHAR(40) NOT NULL,
    category VARCHAR(30),
    quantity INT,
    unit_cost DECIMAL(7,2),
    received_on DATE,
);
-- step 7: Insert three records
INSERT INTO INVENTORY
(item_id, item_name, category, quantity, unit_cost, received_on)
VALUES
(1, 'laser mouse', 'peripherals', 25, 18.50, '2026-02-10'),
(2, 'Mechanical Keyboard', 'peripherals', 12, 64.00, '2026-03-05'),
(3, 'USB hub', 'Accessorries', 40, 22.75, '2026-04-18');
SELECT * FROM INVENTORY;
-- Step 8: Select, update one record, then select again
SELECT item_id, item_name, unit_cost,
FROM INVENTORY
-- change the mechanical keyboard price
UPDATE INVENTORY
SET unit_cost = 59.99
WHERE item_id = 2;
-- show thr prices to confirm the change
SELECT item_id, item_name, unit_cost
FROM INVENTORY;
-- Step 9: Create a view and select from it
CREATE VIEW inventory_view AS
SELECT 
item_id,
quantity,
unit_cost,
quantity * unit_cost AS total_cost
FROM INVENTORY;
-- shows the products from highest to lowest total cost
SELECT * FROM inventory_view
ORDER BY total_cost DESC;
-- Step 10: Copy the table, then give the copy a primary key
CREATE TABLE INVENTORY_COPY AS
SELECT * FROM INVENTORY;
-- look at the copy and see if the primary key is there
SHOW CREATE TABLE INVENTORY_COPY;


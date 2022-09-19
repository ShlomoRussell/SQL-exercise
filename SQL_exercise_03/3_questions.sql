-- The Warehouse
-- lINK: https://en.wikibooks.org/wiki/SQL_Exercises/The_warehouse
--3.1 Select all warehouses.
SELECT * FROM WAREHOUSES;

--3.2 Select all boxes with a value larger than $150.
SELECT * FROM BOXES WHERE Value > 150;

--3.3 Select all distinct contents in all the boxes.
SELECT DISTINCT Contents FROM BOXES;

--3.4 Select the average value of all the boxes.
SELECT AVG(VALUE) FROM BOXES;

--3.5 Select the warehouse code and the average value of the boxes in each warehouse.
SELECT Warehouse, AVG(VALUE) FROM BOXES GROUP BY WAREHOUSE;

--3.6 Same as previous exercise, but select only those warehouses where the average value of the boxes is greater than 150.
SELECT Warehouse, AVG(VALUE) FROM BOXES GROUP BY WAREHOUSE HAVING AVG(VALUE) > 150;

--3.7 Select the code of each box, along with the name of the city the box is located in.
SELECT B.Code, W.Location FROM BOXES B JOIN WAREHOUSES W ON B.Warehouse = W.CODE;

--3.8 Select the warehouse codes, along with the number of boxes in each warehouse. 
SELECT W.CODE, SUM(B.VALUE) FROM BOXES B LEFT JOIN WAREHOUSES W ON B.Warehouse = W.CODE GROUP BY W.CODE;

    -- Optionally, take into account that some warehouses are empty (i.e., the box count should show up as zero, instead of omitting the warehouse from the result).
--3.9 Select the codes of all warehouses that are saturated (a warehouse is saturated if the number of boxes in it is larger than the warehouse's capacity).
SELECT W.CODE FROM WAREHOUSES W WHERE W.Capacity < (SELECT COUNT(*) FROM BOXES WHERE Warehouse = W.CODE);

--3.10 Select the codes of all the boxes located in Chicago.
SELECT B.CODE FROM BOXES B JOIN WAREHOUSES W ON B.WAREHOUSE = W.CODE WHERE LOCATION = 'CHICAGO' ;

--3.11 Create a new warehouse in New York with a capacity for 3 boxes.
INSERT INTO WAREHOUSES(Code,Location,Capacity) VALUES(6, 'New York', 3);

--3.12 Create a new box, with code "H5RT", containing "Papers" with a value of $200, and located in warehouse 2.
INSERT INTO BOXES(Code,Contents,Value,Warehouse) VALUES('H5RT','Papers',200,2);

--3.13 Reduce the value of all boxes by 15%.
UPDATE BOXES SET VALUE = VALUE * 0.85;

--3.14 Remove all boxes with a value lower than $100.
DELETE FROM BOXES WHERE VALUE < 100;

-- 3.15 Remove all boxes from saturated warehouses.
DELETE FROM BOXES WHERE WAREHOUSE IN 
(SELECT W.CODE FROM WAREHOUSES W WHERE W.Capacity < 
(SELECT COUNT(*) FROM BOXES WHERE Warehouse = W.CODE));

-- 3.16 Add Index for column "Warehouse" in table "boxes"
CREATE INDEX Warehouse_IDX ON BOXES(Warehouse);
    -- !!!NOTE!!!: index should NOT be used on small tables in practice
-- 3.17 Print all the existing indexes
select *
from sys.indexes 
  
-- !!!NOTE!!!: index should NOT be used on small tables in practice
-- 3.18 Remove (drop) the index you added just
drop index boxes.Warehouse_IDX
    -- !!!NOTE!!!: index should NOT be used on small tables in practice

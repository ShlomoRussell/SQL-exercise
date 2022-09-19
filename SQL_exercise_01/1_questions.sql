-- LINK: https://en.wikibooks.org/wiki/SQL_Exercises/The_computer_store
-- 1.1 Select the names of all the products in the store.
 SELECT * FROM products;
-- 1.2 Select the names and the prices of all the products in the store.
SELECT name, price FROM Products;
-- 1.3 Select the name of the products with a price less than or equal to $200.
SELECT name FROM products where price < 200; 
-- 1.4 Select all the products with a price between $60 and $120.
SELECT * FROM Products WHERE PRICE > 60 AND PRICE < 120;
-- 1.5 Select the name and price in cents (i.e., the price must be multiplied by 100).
SELECT NAME, PRICE * 100 AS CENTS FROM PRODUCTS;
-- 1.6 Compute the average price of all the products.
SELECT AVG(PRICE) FROM PRODUCTS;
-- 1.7 Compute the average price of all products with manufacturer code equal to 2.
SELECT AVG(PRICE) FROM PRODUCTS WHERE Manufacturer = 2;
-- 1.8 Compute the number of products with a price larger than or equal to $180.
SELECT COUNT(PRICE) FROM PRODUCTS WHERE PRICE <= 180 
-- 1.9 Select the name and price of all products with a price larger than or equal to $180,and sort first by price (in descending order), and then by name (in ascending order).
SELECT NAME, PRICE FROM PRODUCTS  WHERE PRICE >= 180 ORDER BY PRICE DESC, NAME ASC;
-- 1.10 Select all the data from the products, including all the data for each product's manufacturer.
SELECT * FROM PRODUCTS P JOIN Manufacturers M ON P.manufacturer = M.CODE;
-- 1.11 Select the product name, price, and manufacturer name of all the products.
SELECT P.NAME, P.PRICE, M.NAME FROM PRODUCTS P JOIN MANUFACTURERS M ON P.manufacturer = M.CODE; 
-- 1.12 Select the average price of each manufacturer's products, showing only the manufacturer's code.
SELECT M.CODE, AVG(P.PRICE) FROM PRODUCTS P JOIN MANUFACTURERS M ON P.manufacturer = M.CODE GROUP BY M.CODE; 
-- 1.13 Select the average price of each manufacturer's products, showing the manufacturer's name.
SELECT M.NAME, AVG(P.PRICE) FROM PRODUCTS P JOIN MANUFACTURERS M ON P.manufacturer = M.CODE GROUP BY M.NAME;
-- 1.14 Select the names of manufacturer whose products have an average price larger than or equal to $150.
SELECT M.NAME FROM MANUFACTURERS M JOIN PRODUCTS P ON P.manufacturer = M.CODE GROUP BY M.NAME HAVING AVG(P.PRICE) <=150 ;
-- 1.15 Select the name and price of the cheapest product.
SELECT TOP 1 PRICE ,NAME FROM PRODUCTS ORDER BY PRICE ASC;
-- 1.16 Select the name of each manufacturer along with the name and price of its most expensive product.
SELECT MAX_PRICE.NAME AS M_NAME,PRODUCTS_OF_MANUFACTURER.NAME AS P_NAME, MAX_PRICE.PRICE AS MAX_PRICE 
FROM 
 (SELECT M.NAME, MAX(PRICE) 
 AS PRICE FROM PRODUCTS, MANUFACTURERS M 
 WHERE MANUFACTURER = M.CODE GROUP BY M.NAME) 
AS MAX_PRICE
LEFT JOIN 
(SELECT P.*, M.NAME M_NAME 
FROM
PRODUCTS P 
JOIN
MANUFACTURERS M 
ON
(P.MANUFACTURER = M.CODE)) AS PRODUCTS_OF_MANUFACTURER 
ON 
(MAX_PRICE.NAME = PRODUCTS_OF_MANUFACTURER.M_NAME
AND MAX_PRICE.PRICE = PRODUCTS_OF_MANUFACTURER.PRICE);
-- 1.17 Add a new product: Loudspeakers, $70, manufacturer 2.
INSERT INTO PRODUCTS(CODE,Name,Price,Manufacturer) VALUES(11,'Loudspeakers',70,2);
-- 1.18 Update the name of product 8 to "Laser Printer".
UPDATE PRODUCTS SET NAME = 'Laser Printer' WHERE CODE = 8;
SELECT * FROM PRODUCTS;
-- 1.19 Apply a 10% discount to all products.
UPDATE PRODUCTS SET PRICE = PRICE * 0.9;
-- 1.20 Apply a 10% discount to all products with a price larger than or equal to $120.
UPDATE PRODUCTS SET PRICE = PRICE * 0.9 WHERE PRICE >= 120;
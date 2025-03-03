-- LINK : https://en.wikibooks.org/wiki/SQL_Exercises/Employee_management
-- 2.1 Select the last name of all employees.
SELECT LastName FROM Employees;
-- 2.2 Select the last name of all employees, without duplicates.
SELECT DISTINCT LastName FROM Employees;
-- 2.3 Select all the data of employees whose last name is "Smith".
SELECT * FROM EMPLOYEES WHERE LASTNAME = 'SMITH';
-- 2.4 Select all the data of employees whose last name is "Smith" or "Doe".
SELECT * FROM EMPLOYEES WHERE LASTNAME = 'SMITH' OR LASTNAME = 'DOE';
-- 2.5 Select all the data of employees that work in department 14.
SELECT * FROM EMPLOYEES WHERE Department = 14;
-- 2.6 Select all the data of employees that work in department 37 or department 77.
SELECT * FROM EMPLOYEES WHERE Department = 37 OR Department = 77;
-- 2.7 Select all the data of employees whose last name begins with an "S".
SELECT * FROM EMPLOYEES WHERE LASTNAME LIKE 'S%';
-- 2.8 Select the sum of all the departments' budgets.
SELECT SUM(BUDGET) FROM Departments ;
-- 2.9 Select the number of employees in each department (you only need to show the department code and the number of employees).
SELECT D.CODE, COUNT(E.Department) AS EMPLOYEES FROM Departments D, EMPLOYEES E GROUP BY D.CODE; 
-- 2.10 Select all the data of employees, including each employee's department's data.
SELECT * FROM EMPLOYEES E JOIN Departments D ON E.Department = D.Code;
-- 2.11 Select the name and last name of each employee, along with the name and budget of the employee's department.
SELECT E.NAME, E.LASTNAME, D.NAME AS DEPARTMENT_NAME, D.BUDGET FROM  EMPLOYEES E JOIN Departments D ON E.Department = D.Code;
-- 2.12 Select the name and last name of employees working for departments with a budget greater than $60,000.
SELECT E.NAME,E.LASTNAME FROM EMPLOYEES E JOIN  Departments D ON E.Department = D.Code WHERE D.BUDGET >60000;
-- 2.13 Select the departments with a budget larger than the average budget of all the departments.
SELECT * FROM DEPARTMENTS WHERE BUDGET > (SELECT AVG(BUDGET) FROM DEPARTMENTS);
-- 2.14 Select the names of departments with more than two employees.
SELECT D.NAME FROM DEPARTMENTS D JOIN EMPLOYEES E ON E.Department = D.Code GROUP BY D.NAME HAVING COUNT(E.DEPARTMENT) > 2 ;
-- 2.15 Very Important - Select the name and last name of employees working for departments with second lowest budget.
SELECT E.NAME, E.LASTNAME FROM EMPLOYEES E
 WHERE DEPARTMENT = (SELECT TOP 1 TEMP.CODE FROM (SELECT TOP 2 * FROM DEPARTMENTS D ORDER BY BUDGET )TEMP  
 ORDER BY TEMP.BUDGET DESC);
-- 2.16  Add a new department called "Quality Assurance", with a budget of $40,000 and departmental code 11. 
INSERT INTO DEPARTMENTS(Code,Name,Budget) VALUES(11,'Quality Assurance',40000);
-- And Add an employee called "Mary Moore" in that department, with SSN 847-21-9811.
INSERT INTO EMPLOYEES(SSN,Name,LastName,Department) VALUES('847219811','Mary',' Moore',11);
-- 2.17 Reduce the budget of all departments by 10%.
UPDATE DEPARTMENTS SET BUDGET = BUDGET * 0.9;
-- 2.18 Reassign all employees from the Research department (code 77) to the IT department (code 14).
UPDATE EMPLOYEES SET DEPARTMENT = 14 WHERE DEPARTMENT = 77; 
-- 2.19 Delete from the table all employees in the IT department (code 14).
DELETE FROM EMPLOYEES WHERE DEPARTMENT = 14;
-- 2.20 Delete from the table all employees who work in departments with a budget greater than or equal to $60,000.
DELETE FROM EMPLOYEES WHERE DEPARTMENT = (SELECT CODE FROM DEPARTMENTS WHERE BUDGET >=60000);
-- 2.21 Delete from the table all employees.
DELETE FROM EMPLOYEES;

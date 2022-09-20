-- https://en.wikibooks.org/wiki/SQL_Exercises/Scientists
-- 6.1 List all the scientists' names, their projects' names, 
    -- and the hours worked by that scientist on each project, 
    -- in alphabetical order of project name, then scientist name.
	SELECT S.NAME, P.NAME AS PROJECT, P.HOURS FROM Scientists S
	JOIN AssignedTo ON S.SSN = Scientist
	JOIN Projects P ON P.CODE = PROJECT 
	ORDER BY P.NAME ASC, S.NAME ASC;
	
-- 6.2 Select the project names which are not assigned yet
SELECT NAME FROM PROJECTS WHERE Code NOT IN (SELECT PROJECT FROM AssignedTo);
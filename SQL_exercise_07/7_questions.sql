-- https://en.wikibooks.org/wiki/SQL_Exercises/Planet_Express 
-- 7.1 Who receieved a 1.5kg package?
SELECT CLIENT.NAME FROM PACKAGE JOIN CLIENT ON PACKAGE.RECIPIENT = CLIENT.AccountNumber WHERE WEIGHT = 1.5;
    -- The result is "Al Gore's Head".
-- 7.2 What is the total weight of all the packages that he sent?
SELECT SUM(WEIGHT) FROM PACKAGE WHERE Sender = (SELECT AccountNumber FROM CLIENT WHERE NAME = 'Al Gore"s Head');

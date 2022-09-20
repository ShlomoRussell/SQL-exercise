-- https://en.wikibooks.org/wiki/SQL_Exercises/Pieces_and_providers
-- 5.1 Select the name of all the pieces. 
SELECT NAME FROM PIECES;

-- 5.2  Select all the providers' data. 
SELECT * FROM providers;

-- 5.3 Obtain the average price of each piece (show only the piece code and the average price).
SELECT CODE, AVG(PRICE) FROM Pieces JOIN Provides ON CODE = PIECE GROUP BY CODE; 

-- 5.4  Obtain the names of all providers who supply piece 1.
SELECT NAME FROM PROVIDERS WHERE CODE IN (SELECT PROVIDER FROM PROVIDES WHERE PIECE = 1);

-- 5.5 Select the name of pieces provided by provider with code "HAL".
SELECT NAME FROM PIECES WHERE CODE 
IN 
(SELECT PIECE FROM PROVIDES WHERE PROVIDER 
IN
(SELECT CODE FROM PROVIDERS WHERE CODE = 'HAL'));
-- 5.6
-- ---------------------------------------------
-- !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
-- Interesting and important one.
-- For each piece, find the most expensive offering of that piece and include the piece name, provider name, and price 
-- (note that there could be two providers who supply the same piece at the most expensive price).
SELECT Pieces.NAME,PROVIDERS.NAME AS PROVIDER,Provides.PRICE FROM Pieces 
INNER JOIN PROVIDES ON Pieces.CODE = PIECE
INNER JOIN PROVIDERS ON PROVIDES.Provider = PROVIDERS.Code 
WHERE Provides.PRICE = (SELECT MAX(PRICE) FROM PROVIDES WHERE PIECE = Pieces.CODE);
-- ---------------------------------------------
-- 5.7 Add an entry to the database to indicate that "Skellington Supplies" (code "TNBC") will provide sprockets (code "1") for 7 cents each.
INSERT INTO Provides(Piece, Provider, Price) VALUES(1,'TNBC',7);
-- 5.8 Increase all prices by one cent.
UPDATE Provides SET PRICE = PRICE + 1;
-- 5.9 Update the database to reflect that "Susan Calvin Corp." (code "RBT") will not supply bolts (code 4).
DELETE FROM PROVIDES  WHERE Provider = 'RBT' AND PIECE = 4;
-- 5.10 Update the database to reflect that "Susan Calvin Corp." (code "RBT") will not supply any pieces 
    -- (the provider should still remain in the database).
DELETE FROM PROVIDES WHERE PROVIDER = 'RBT';


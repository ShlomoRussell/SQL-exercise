-- https://en.wikibooks.org/wiki/SQL_Exercises/Movie_theatres
-- 4.1 Select the title of all movies.
select Title from movies;

-- 4.2 Show all the distinct ratings in the database.
select distinct Rating from movies;

-- 4.3  Show all unrated movies.
select * from movies where rating is null;

-- 4.4 Select all movie theaters that are not currently showing a movie.
select * from MovieTheaters where Movie is null;

-- 4.5 Select all data from all movie theaters 
select * from MovieTheaters;

    -- and, additionally, the data from the movie that is being shown in the theater (if one is being shown).
	select mt.* from MovieTheaters mt left join movies on mt.movie = movies.code;

-- 4.6 Select all data from all movies and, if that movie is being shown in a theater, show the data from the theater.
SELECT * FROM Movies  LEFT JOIN MovieTheaters ON  movies.code =  movie;

-- 4.7 Show the titles of movies not currently being shown in any theaters.
SELECT TITLE FROM MOVIES WHERE CODE NOT IN (SELECT MOVIE FROM MovieTheaters WHERE MOVIE IS NOT NULL);

-- 4.8 Add the unrated movie "One, Two, Three".
INSERT INTO MOVIES(Code,Title) VALUES(9,'One, Two, Three')

-- 4.9 Set the rating of all unrated movies to "G".
UPDATE MOVIES SET RATING = 'G' WHERE RATING IS NULL

-- 4.10 Remove movie theaters projecting movies rated "NC-17".
DELETE FROM MovieTheaters WHERE MOVIE IN (SELECT CODE FROM MOVIES WHERE RATING = 'NC-17');

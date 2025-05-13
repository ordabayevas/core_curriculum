CREATE TABLE movies (
  id serial PRIMARY KEY,
  title text NOT NULL,
  year integer NOT NULL,
  run_time integer NOT NULL,
  CHECK ( year BETWEEN 1000 AND 9999 )
);


INSERT INTO movies (title, year, run_time) VALUES 
('Gravity', '2013',	91),
('M*A*S*H',	'1970',	116),
('My Fair Lady',	'1964',	170),
('Ocean''s Eleven',	'2001',	116),
('The Perfect Storm',	'2000',	130),
('While You Were Sleeping',	'1995',	103),
('2001: A Space Odyssey',	'1968',	149);

SELECT title AS "Movie Title", year AS "Released", run_time AS "Run Time"
FROM movies
WHERE year::integer < 2000
ORDER BY run_time DESC LIMIT 3;

CREATE TABLE actors (
  id serial PRIMARY KEY,
  name text NOT NULL
);

INSERT INTO actors (name) VALUES
('Abe Vigoda'),
('Audrey Hepburn'),
('Barbara Billingsley'),
('Elliot Gould'),
('George Clooney'),
('Sandra Bullock');

CREATE TABLE actors_movies (
  id serial PRIMARY KEY,
  movie_id integer NOT NULL REFERENCES movies (id),
  actor_id integer NOT NULL REFERENCES actors (id)
);

INSERT INTO actors_movies (movie_id, actor_id) VALUES
(4, 5),
(4, 4),
(5, 5),
(2, 4),
(3, 2),
(1, 6),
(1, 5),
(6, 6);

SELECT actors.* 
FROM actors_movies 
JOIN actors 
  ON actors_movies.actor_id = actors.id 
JOIN movies 
  ON actors_movies.movie_id = movies.id 
WHERE movies.title = 'Gravity';

SELECT movies.id, movies.title
FROM actors_movies 
JOIN actors 
  ON actors_movies.actor_id = actors.id 
JOIN movies 
  ON actors_movies.movie_id = movies.id 
WHERE actors.name = 'George Clooney';

SELECT actors.name AS "Actor", COUNT(movie_id) AS "Number of Movies" 
FROM actors_movies 
JOIN actors 
  ON actors_movies.actor_id = actors.id 
  JOIN movies 
    ON actors_movies.movie_id = movies.id 
GROUP BY actors.name 
  HAVING COUNT(movie_id) >= 2;

SELECT a.name AS "Actor", COUNT(movie_id) AS "Number of Movies", ROUND(AVG(run_time), 0) AS "Average Run Time"
FROM actors_movies AS am
RIGHT OUTER JOIN actors AS a
  ON am.actor_id = a.id 
  LEFT OUTER JOIN movies 
    ON am.movie_id = movies.id
GROUP BY a.name
ORDER BY COUNT(movie_id) DESC, ROUND(AVG(run_time), 0) DESC;

SELECT name AS "Actor" FROM actors WHERE id NOT IN (SELECT actor_id FROM actors_movies);

SELECT title AS "Movie Title" FROM movies WHERE id NOT IN (SELECT movie_id FROM actors_movies);

ALTER TABLE movies 
ADD CHECK (year::integer >= 1878);

INSERT INTO movies (title, year, run_time) 
VALUES ('Gravity', '1877', 91);
*/
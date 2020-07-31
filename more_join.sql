-- 1962 movies

SELECT id, title
 FROM movie
 WHERE yr=1962

-- When was Citizen Kane released?

SELECT yr
 FROM movie
 WHERE title = 'Citizen Kane'

-- Star Trek movies

SELECT id, title, yr
 FROM movie
 WHERE title LIKE '%Star Trek%' ORDER BY yr

-- id for actor Glenn Close

SELECT id
 FROM actor
 WHERE name =  'Glenn Close'

-- id for Casablanca

SELECT id
 FROM movie
 WHERE title = 'Casablanca'

-- Cast list for Casablanca

SELECT name
 FROM actor JOIN casting ON id=actorid
 WHERE movieid=11768

-- Alien cast list

SELECT name
 FROM actor JOIN casting ON actor.id = casting.actorid JOIN movie ON casting.movieid = movie.id
WHERE title = 'Alien'

-- Harrison Ford movies

SELECT title
 FROM actor JOIN casting ON actor.id = casting.actorid JOIN movie ON casting.movieid = movie.id
WHERE name = 'Harrison Ford'

-- Harrison Ford as a supporting actor

SELECT title
 FROM actor JOIN casting ON actor.id = casting.actorid JOIN movie ON casting.movieid = movie.id
WHERE name = 'Harrison Ford' AND ord!=1

-- Lead actors in 1962 movies

SELECT title, name
 FROM actor JOIN casting ON actor.id = casting.actorid JOIN movie ON casting.movieid = movie.id
WHERE yr = 1962 AND ord=1
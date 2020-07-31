-- Show the total population of the world.

SELECT SUM(population)
FROM world

-- List all the continents - just once each.

SELECT continent
FROM world GROUP BY continent

-- Give the total GDP of Africa

SELECT SUM(GDP)
FROM world WHERE continent = 'Africa'

-- How many countries have an area of at least 1000000

SELECT COUNT(name)
FROM world
WHERE area >= 1000000

-- What is the total population of ('Estonia', 'Latvia', 'Lithuania')

SELECT SUM(population)
FROM world
WHERE name IN ('Estonia', 'Latvia', 'Lithuania')

-- For each continent show the continent and number of countries.

SELECT continent, COUNT(name)
FROM world x WHERE name IN (SELECT name FROM world y WHERE y.continent = x.continent) GROUP BY continent

-- For each continent show the continent and number of countries with populations of at least 10 million.

SELECT continent, COUNT(name)
FROM world x WHERE name IN (SELECT name FROM world y WHERE y.continent = x.continent AND population >= 10000000) GROUP BY continent

-- List the continents that have a total population of at least 100 million.

SELECT continent
FROM world x WHERE 100000000 < (SELECT SUM(population) FROM world y WHERE y.continent = x.continent) GROUP BY continent

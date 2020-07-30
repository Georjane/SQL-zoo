-- Bigger than Russia

SELECT name FROM world
  WHERE population >
     (SELECT population FROM world
      WHERE name='Russia')

-- Richer than UK

SELECT name FROM world
  WHERE continent = 'Europe' AND gdp/population >
     (SELECT gdp/population FROM world
      WHERE name='United Kingdom')

-- Neighbours of Argentina and Australia

SELECT name, continent FROM world
  WHERE continent IN (SELECT continent FROM world
      WHERE name = 'Argentina' OR name = 'Australia') ORDER BY name

-- Between Canada and Poland

SELECT name, population FROM world
  WHERE population > (SELECT population FROM world
      WHERE name = 'Canada') AND population < (SELECT population FROM world
      WHERE name = 'Poland')

-- Percentages of Germany

SELECT name, CONCAT((ROUND(population/(SELECT population FROM world WHERE name = 'Germany')*100)), '%') FROM world
  WHERE continent = 'Europe'

-- Bigger than every country in Europe

SELECT name
  FROM world
 WHERE GDP > ALL(SELECT GDP
                           FROM world
                          WHERE continent = 'Europe' AND GDP > 0)

-- Largest in each continent

SELECT continent, name, area FROM world x
  WHERE area >= ALL
    (SELECT area FROM world y
        WHERE y.continent=x.continent
          AND area>0)

-- First country of each continent (alphabetically)

SELECT continent, name FROM world x
WHERE name = (SELECT name FROM world y WHERE y.continent=x.continent ORDER BY name LIMIT 1) ;

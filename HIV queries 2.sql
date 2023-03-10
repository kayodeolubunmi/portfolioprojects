CREATE TABLE hivsqldata
(Entity varchar(50),
 Code varchar(50),
 Year int,
 Deaths int,
 Incidence int,
 Prevalence decimal);
 
 SELECT *
 FROM hivsqldata

SELECT DISTINCT entity
FROM hivsqldata
ORDER BY entity ASC

SELECT COUNT(year)
FROM hivsqldata
WHERE entity='Cuba'

--total number of deaths by country
SELECT entity, SUM(deaths) AS deathtotal
FROM hivsqldata
GROUP BY entity
ORDER BY entity ASC

--total number of new cases by country
SELECT entity, SUM(incidence) AS newcases
FROM hivsqldata
GROUP BY entity
ORDER BY entity ASC

--total number of deaths by year
SELECT year, SUM(deaths) AS yearlydeaths
FROM hivsqldata
GROUP BY year
ORDER BY year DESC

--average deaths by year
SELECT year, AVG(deaths) AS avgydeaths
FROM hivsqldata
GROUP BY year
ORDER BY year DESC


--total number of newcases by year
SELECT year, SUM(incidence) AS yearlycases
FROM hivsqldata
GROUP BY year
ORDER BY year DESC

--prevalence per country 
SELECT entity, SUM(prevalence) AS prev
FROM hivsqldata
GROUP BY entity
ORDER BY entity DESC

--prevalence per country and year
SELECT entity, year, SUM(prevalence) AS prev
FROM hivsqldata
GROUP BY year, entity
ORDER BY year ASC

--country and year with highest deaths
SELECT entity, year, MAX(deaths) AS deathsmax
FROM hivsqldata
GROUP BY entity, year
ORDER BY year ASC


SELECT  MAX(deaths) AS deathmax
FROM hivsqldata

SELECT entity,Code, deaths
FROM hivsqldata
WHERE Code ISNULL

SELECT entity, Code, deaths
FROM hivsqldata
WHERE Code IS NOT NULL

SELECT entity, deaths
FROM hivsqldata
WHERE entity LIKE '%st%'

SELECT entity, deaths
FROM hivsqldata
WHERE entity NOT LIKE '%st%'

--selecting some years
SELECT year, SUM(deaths) AS selydeaths
FROM hivsqldata
WHERE year IN (1994,2001)
GROUP BY year
ORDER BY year DESC

SELECT year, SUM(deaths) AS selydeaths
FROM hivsqldata
WHERE year IN (1995, 1999)
GROUP BY year
ORDER BY year DESC


--selecting some years
SELECT year, SUM(deaths) AS selydeaths
FROM hivsqldata
WHERE year BETWEEN 1994 AND 2001
GROUP BY year
ORDER BY year DESC

SELECT entity, year, incidence, prevalence
FROM hivsqldata
WHERE year=1990
AND entity LIKE 'A%'

SELECT entity, year, incidence, prevalence
FROM hivsqldata
WHERE year=1990
OR entity LIKE 'A%'

SELECT year, incidence
FROM hivsqldata
WHERE year=1990
ORDER BY Year DESC
LIMIT 5

SELECT entity, year, incidence,
CASE 
WHEN incidence < 100 THEN 'low'
WHEN incidence = 100 THEN 'average'
ELSE 'high'
END
FROM hivsqldata

SELECT entity, year, incidence,
CASE 
WHEN incidence <= 100 THEN 'low'
WHEN incidence BETWEEN 100 AND 500 THEN 'average'
ELSE 'high'
END AS grading
FROM hivsqldata







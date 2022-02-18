USE world;

-- Попробовать CROSS JOIN между таблицами городов и стран
SELECT * FROM city, country;

-- При помощи INNER JOIN: вывести код страны, название страны и название города-столицы
SELECT 
	co.code AS CountryCode, 
    ci.name AS Capital, 
    co.name AS Country
FROM city AS ci
INNER JOIN country AS co
	ON ci.id = co.capital;

-- запрос, который выводит имя города, его численность, а также код и название его страны
SELECT 
	ci.name AS City, 
    ci.population AS Population, 
    co.code AS Code, 
    co.name AS Country
FROM city AS ci
INNER JOIN country AS co
	ON co.code = ci.countryCode;
    
-- Для каждого континента выведите количество городов из этого континента
SELECT 
	co.continent AS Continents, 
    COUNT(ci.name) AS NumberOfCities
FROM country AS co
LEFT JOIN city AS ci
	ON ci.CountryCode = co.Code
GROUP BY Continents;


--  количество официальных языков для каждой страны в порядке убывания количества этих языков
SELECT co.name AS Countries, COUNT(l.isOfficial) AS OfficialLanguages
FROM country AS co
LEFT JOIN countrylanguage AS l
	ON co.code = l.countrycode
WHERE l.isOfficial = 'T' OR l.isOfficial IS NULL
GROUP BY Countries
ORDER BY OfficialLanguages DESC;
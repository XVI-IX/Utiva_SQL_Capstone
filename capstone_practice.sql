SELECT *
FROM dsf_capstone.international_brewries;

-- 1. Within the space of the last three years, what was the profit worth of the breweries,
-- inclusive of the anglophone and the francophone territories?

SELECT DISTINCT countries
FROM dsf_capstone.international_brewries;

SELECT countries, years, SUM(profit)
FROM dsf_capstone.international_brewries
GROUP BY countries, years
ORDER BY years;

SELECT SUM(profit)
FROM dsf_capstone.international_brewries;

/*
2. Compare the total profit between these two territories in order for the territory manager,
	Mr. Stone made a strategic decision that will aid profit maximization in 2020.
*/

SELECT SUM(profit) AS total_anglophone_profits
FROM dsf_capstone.international_brewries
WHERE countries IN ('Nigeria', 'Ghana');

SELECT SUM(profit) AS total_francophone_profits
FROM dsf_capstone.international_brewries
WHERE NOT countries IN ('Nigeria', 'Ghana');

SELECT SUM(profit) AS total_francophone_profits
FROM dsf_capstone.international_brewries
WHERE countries IN ('Benin', 'Senegal', 'Togo');


-- 3. Country that generated the highest profit in 2019
SELECT countries, SUM(profit)
FROM dsf_capstone.international_brewries
WHERE  years = 2019
GROUP BY 1
ORDER BY 2 DESC
LIMIT 1;

-- 4. Help him find the year with the highest profit.
SELECT years, SUM(profit)
FROM dsf_capstone.international_brewries
GROUP BY years
ORDER BY 2 DESC
LIMIT 1;

-- 5. Which month in the three years was the least profit generated?
SELECT months, SUM(profit)
FROM dsf_capstone.international_brewries
GROUP BY months
ORDER BY 2 ASC
LIMIT 1;

**
SELECT months, years, SUM(profit)
FROM dsf_capstone.international_brewries
GROUP BY months, years
ORDER BY 3 ASC
LIMIT 1;

-- 6. What was the minimum profit in the month of December 2018?
SELECT MIN(profit)
FROM dsf_capstone.international_brewries
WHERE months = 'December' AND years = 2018;

-- 8. Which particular brand generated the highest profit in Senegal?
SELECT brands, countries, SUM(profit)
FROM dsf_capstone.international_brewries
WHERE countries = 'Senegal'
GROUP BY brands, countries
ORDER BY SUM(profit) DESC
LIMIT 1;

-- 1. Within the last two years, the brand manager wants to know the top three brands
--    consumed in the francophone countries
-- quantity
-- brands
SELECT brands, SUM(quantity)
FROM dsf_capstone.international_brewries
WHERE countries IN ('Senegal', 'Benin', 'Togo') AND years IN (2018, 2019)
GROUP BY brands
ORDER BY 2 DESC
LIMIT 3;

-- 2. Find out the top two choice of consumer brands in Ghana
SELECT brands, SUM(quantity)
FROM dsf_capstone.international_brewries
WHERE countries = 'Ghana'
GROUP BY brands
ORDER BY 2 DESC
LIMIT 2;

/*
	3. Find out the details of beers consumed in the past three years in the most oil reached
	country in West Africa.

*/
-- all details
-- most oil rich country (Nigeria)
-- wants beers only
SELECT DISTINCT brands
FROM dsf_capstone.international_brewries

SELECT * 
FROM dsf_capstone.international_brewries
WHERE countries = 'Nigeria' AND brands NOT LIKE '%malt';

-- 4. Favorites malt brand in Anglophone region between 2018 and 2019
-- quantity
SELECT brands, SUM(quantity)
FROM dsf_capstone.international_brewries
WHERE countries IN ('Nigeria', 'Ghana') 
AND years IN (2018, 2019) 
AND brands LIKE '%malt'
GROUP BY brands
ORDER BY SUM(quantity) DESC
LIMIT 1;

-- 5. Which brands sold the highest in 2019 in Nigeria?
SELECT brands, SUM(quantity)
FROM dsf_capstone.international_brewries
WHERE countries = 'Nigeria' AND years = 2019
GROUP BY brands
ORDER BY 2 DESC
LIMIT 2;

-- 6. Favorites brand in South_South region in Nigeria
SELECT brands, SUM(quantity)
FROM dsf_capstone.international_brewries
WHERE region = 'southsouth' AND countries = 'Nigeria'
GROUP BY brands
ORDER BY 2 DESC
LIMIT 1;




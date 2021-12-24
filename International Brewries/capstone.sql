SELECT *
FROM dsf_capstone.international_brewries

-- 1. Within the space of the last three years, what was the profit worth of the breweries,
--    inclusive of the anglophone and the francophone territories

SELECT DISTINCT countries
FROM dsf_capstone.international_brewries

SELECT brands, SUM(profit)
FROM dsf_capstone.international_brewries
GROUP BY brands
ORDER BY 2 DESC;


-- 2. Compare the total profit between these two territories in order for the territory manager,
--    Mr. Stone made a strategic decision that will aid profit maximization in 2020.
-- Anglophone Countries
SELECT countries, SUM(profit)
FROM dsf_capstone.international_brewries
WHERE countries IN ('Nigeria', 'Ghana')
GROUP BY countries;

-- Francophone Countries
SELECT countries, SUM(profit)
FROM dsf_capstone.international_brewries
WHERE countries NOT IN ('Nigeria', 'Ghana')
GROUP BY countries;

-- 3.  Country that generated the highest profit in 2019
SELECT countries, SUM(profit)
FROM dsf_capstone.international_brewries
WHERE years = 2019
GROUP BY countries
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
GROUP BY 1
ORDER BY 2 ASC
LIMIT 1;


-- 6. What was the minimum profit in the month of December 2018?
SELECT MIN(profit)
FROM dsf_capstone.international_brewries
WHERE months = 'December' AND years = 2018;


-- 7. Compare the profit in percentage for each of the month in 2019
SELECT years, SUM(profit)
FROM dsf_capstone.international_brewries
WHERE years = 2019
GROUP BY years;

SELECT months, ROUND((CAST (SUM(profit) as DECIMAL) / 30020250) * 100, 4) as "Profit Percentage"
FROM dsf_capstone.international_brewries
WHERE years = 2019
GROUP BY 1;


-- 8. Which particular brand generated the highest profit in Senegal?
SELECT brands, SUM(profit)
FROM dsf_capstone.international_brewries
WHERE countries = 'Senegal'
GROUP BY brands
ORDER BY 2 DESC
LIMIT 1;


-- Session B -  Brand Analysis

-- 1. Within the last two years, the brand manager wants to know the top three brands
--    consumed in the francophone countries
--    Francophone countries: Senegal, Benin, Togo

SELECT brands, SUM(quantity)
FROM dsf_capstone.international_brewries
WHERE countries IN ('Senegal', 'Benin', 'Togo')
GROUP BY brands
ORDER BY 2 DESC
LIMIT 3;


-- 2. Find out the top two choice of consumer brands in Ghana
-- Using quantity as a metric to represent choice
SELECT brands, SUM(quantity)
FROM dsf_capstone.international_brewries
WHERE countries = 'Ghana'
GROUP BY 1
ORDER BY 2 DESC
LIMIT 2;


-- 3. Find out the details of beers consumed in the past three years in the most oil reached
-- country in West Africa.
-- Having Nigeria as the most oil rich country in West Africa

SELECT *
FROM dsf_capstone.international_brewries
WHERE countries = 'Nigeria' AND brands NOT LIKE '%malt';


-- 4. Favorites malt brand in Anglophone region between 2018 and 2019
SELECT brands
FROM dsf_capstone.international_brewries
WHERE brands LIKE '%malt'
AND countries IN ('Nigeria', 'Ghana')
AND years BETWEEN 2018 AND 2019
GROUP BY brands
ORDER BY SUM(quantity) DESC
LIMIT 1;


-- 5. Which brands sold the highest in 2019 in Nigeria?
SELECT brands, SUM(quantity) AS "Total Sold"
FROM dsf_capstone.international_brewries
WHERE years = 2019 
AND countries = 'Nigeria'
GROUP BY brands
ORDER BY 2;


-- 6. Favorites brand in South_South region in Nigeria
SELECT brands 
FROM dsf_capstone.international_brewries
WHERE countries = 'Nigeria'
AND region = 'southsouth'
GROUP BY brands
ORDER BY SUM(quantity);

--7. Beer consumption in Nigeria
SELECT SUM(quantity)
FROM dsf_capstone.international_brewries
WHERE countries = 'Nigeria'
AND brands NOT LIKE '%malt';


--8. Level of consumption of Budweiser in the regions in Nigeria
SELECT region, SUM(quantity) as "Budweiser Consumed"
FROM dsf_capstone.international_brewries
WHERE brands = 'budweiser'
GROUP BY region;


-- 9. Level of consumption of Budweiser in the regions in Nigeria in 2019 (Decision on Promo)
SELECT region, SUM(quantity) as "Budweiser Consumed(2019)"
FROM dsf_capstone.international_brewries
WHERE brands = 'budweiser'
AND years = 2019
GROUP BY region;


-- Session C
-- Countries Analysis

--1. Country with the highest consumption of beer
SELECT countries, SUM(quantity)
FROM dsf_capstone.international_brewries
WHERE brands NOT LIKE ('%malt')
GROUP BY countries
ORDER BY 2 DESC
LIMIT 1;


--2. Highest sales personnel of Budweiser in Senegal
SELECT sales_rep, MAX(quantity)
FROM dsf_capstone.international_brewries
WHERE brands = 'budweiser'
AND countries = 'Senegal'
GROUP BY 1
ORDER BY 2 DESC
LIMIT 1


--3. Country with the highest profit of the fourth quarter in 2019
-- Fourth quarter - september, october, november, december

SELECT countries, SUM(profit)
FROM dsf_capstone.international_brewries
WHERE months IN ('September', 'October', 'November', 'December')
AND years = 2019
GROUP BY 1
ORDER BY 2 DESC
LIMIT 1


-- Netflix Project
DROP TABLE IF EXISTS netflix;
Create TABLE Netflix
(
    show_id VARCHAR(6),
	type    VARCHAR (10),
	title    VARCHAR (150),
	director    VARCHAR (208), 
	casts    VARCHAR (1000),
	country    VARCHAR (150),
	date_added  VARCHAR (50),
	release_year INT,
	rating    VARCHAR (10),
	duration   VARCHAR (15),
	listed_in   VARCHAR (100),
	description   VARCHAR (250)
);

SELECT * FROM Netflix;


SELECT 
	COUNT(*) as total_content 
FROM netflix;


SELECT 
	DISTINCT type
FROM netflix;



-- 5 Business Problems

--1. Count the number of Movies and TV Shows

SELECT
	type,
	COUNT(*) as total_content
From Netflix
GROUP BY type

2. Find the most common rating for Movies and TV shows

SELECT
	type,
	rating,
	Count (*)
FROM Netflix
GROUP BY 1, 2


3. Find the movies released in 2020

SELECT * FROM Netflix
WHERE 
	type = 'Movie'
	AND
	release_year = 2020


4. What are the top 5 counties with the most content on netflix?

SELECT 
	UNNEST(STRING_TO_ARRAY(country, ',')) as new_country,
	COUNT (show_id) as total_content
FROM netflix
GROUP BY 1
ORDER BY 2 DESC
LIMIT 5




5. List all TV shows with more than 5 seasons

SELECT 
	*
FROM netflix
WHERE
	type = 'TV Show'
	AND
	SPLIT_PART(duration, ' ', 1)::numeric > 5 



-- PLEASE READ THIS BEFORE RUNNING THE EXERCISE

-- ⚠️ IMPORTANT: This SQL file may crash due to two common issues: comments and missing semicolons.

-- ✅ Suggestions:
-- 1) Always end each SQL query with a semicolon `;`
-- 2) Ensure comments are well-formed:
--    - Use `--` for single-line comments only
--    - Avoid inline comments after queries
--    - Do not use `/* */` multi-line comments, as they may break execution

-- -----------------------------------------------
-- queries.sql
-- Complete each mission by writing your SQL query
-- directly below the corresponding instruction
-- -----------------------------------------------;

SELECT * FROM regions;
SELECT * FROM species;
SELECT * FROM climate;
SELECT * FROM observations;


-- MISSION 1
-- Your query here;
SELECT 
    regions.name, COUNT(DISTINCT species_id) AS total_species
FROM
    observations
        INNER JOIN
    regions ON observations.region_id = regions.id
GROUP BY regions.name , regions.country
ORDER BY total_species DESC;
-- MISSION 2
-- Your query here;
SELECT 
    --MONTH(observation_date) AS month, count(*) as total
    strftime('%m', observations.observation_date) AS month,
    COUNT(*) AS total
FROM 
    observations
GROUP BY month
ORDER BY total;

-- MISSION 3
-- Your query here;
SELECT 
    species.scientific_name,
    species.common_name,
    SUM(observations.count) AS total_observations
FROM
    observations
        INNER JOIN
    species ON observations.species_id = species.id
GROUP BY species.id
HAVING total_observations < 5
ORDER BY total_observations;

-- MISSION 4
-- Your query here;
SELECT 
    regions.name, COUNT(DISTINCT species_id) AS total_species
FROM
    observations
        INNER JOIN
    regions ON observations.region_id = regions.id
GROUP BY regions.name , regions.country
ORDER BY total_species DESC
LIMIT 1;

-- MISSION 5
-- Your query here;
SELECT 
    species.scientific_name,
    species.common_name,
    COUNT(observations.count) AS total_observations
FROM
    observations
        INNER JOIN
    species ON observations.species_id = species.id
GROUP BY species.id
ORDER BY total_observations DESC
LIMIT 10;

-- MISSION 6
-- Your query here;
SELECT 
    observer, COUNT(*) AS registers
FROM
    observations
GROUP BY observer
ORDER BY registers DESC
LIMIT 10;

-- MISSION 7
-- Your query here;
SELECT 
    species.scientific_name, species.common_name
FROM
    observations
        RIGHT JOIN
    species ON observations.species_id = species.id
WHERE
    observations.species_id IS NULL;

-- MISSION 8
-- Your query here;
SELECT 
    observation_date, COUNT(*) AS total
FROM
    observations
GROUP BY observation_date
ORDER BY total DESC
LIMIT 10;



/* @bruin
name: actor_formatting
type: duckdb.sql
depends:
  - raw.actor
columns:
  - name: actor_name
    type: varchar
  - name: actor_id
    type: varchar
  - name: average_rating
    type: double
@bruin */

-- STEP 1: DATA TRANSFORMATION (Type Casting)
DROP TABLE IF EXISTS actor_formatting;

CREATE TABLE actor_formatting AS 
SELECT 
    actor AS actor_name, 
    actor_id, 
    film, 
    CAST(year AS INTEGER) AS year, 
    CAST(votes AS INTEGER) AS votes,
    CAST(rating AS DECIMAL(18,3)) AS rating
FROM raw.actor;

-- STEP 2: DATA AGGREGATION (Business Logic)
DROP TABLE IF EXISTS actor2;

CREATE TABLE actor2 AS
SELECT 
    actor_name,
    actor_id,
    AVG(rating) AS average_rating
FROM actor_formatting
GROUP BY actor_name, actor_id
ORDER BY average_rating DESC;

-- STEP 3: DATA SERVING (Export output ke CSV)
COPY (SELECT * FROM actor_formatting) TO 'change_format.csv' (HEADER, DELIMITER ',');
COPY (SELECT * FROM actor2) TO 'average_rating.csv' (HEADER, DELIMITER ',');

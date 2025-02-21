SELECT *
FROM de_db.dbt_spacex.launches;

-------------------------------------

SELECT *
FROM de_db.dbt_spacex.launches
WHERE success = true;

-------------------------------------

SELECT *
FROM de_db.dbt_spacex.launches
ORDER BY launch_date DESC;

-------------------------------------

SELECT *
FROM de_db.dbt_spacex.launches
ORDER BY launch_date DESC
LIMIT 1;

-------------------------------------

SELECT rocket,
COUNT(*) AS launches_number
FROM de_db.dbt_spacex.launches
GROUP BY rocket;

-------------------------------------

SELECT
    rocket,
    AVG(
        CASE
            WHEN success = true THEN 1 ELSE 0 END 
    ) AS success_rate
FROM de_db.dbt_spacex.launches
WHERE success IS NOT NULL
GROUP BY rocket;

-------------------------------------

SELECT l.name AS launch_name,
r.name AS rocket_name,
r.country,
r.first_flight,
l.launch_date,
r.cost_per_launch,
r.success_rate_pct,
r.active,
---- Trying to handle null values in Snowflake in proper way ----
COALESCE(TO_VARCHAR(l.success), 'Unknown') AS success_status
FROM de_db.dbt_spacex.rockets r
JOIN de_db.dbt_spacex.launches l 
ON r.id = l.rocket;

-------------------------------------

SELECT YEAR(launch_date) AS launch_year,
COUNT(*) AS launches_number
FROM de_db.dbt_spacex.launches
GROUP BY launch_year;

-------------------------------------

SELECT *
FROM de_db.dbt_spacex.launches
WHERE launch_date = (
    SELECT MAX(launch_date)
    FROM de_db.dbt_spacex.launches
);

-------------------------------------

WITH recent_launches AS (
    SELECT *
    FROM de_db.dbt_spacex.launches
    WHERE launch_date > '2020-01-01'
)

SELECT *
FROM recent_launches;
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
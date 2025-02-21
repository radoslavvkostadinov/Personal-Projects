CREATE OR REPLACE VIEW de_db.dbt_spacex.successful_launches AS
    SELECT *
    FROM de_db.dbt_spacex.launches
    WHERE success = true;


SELECT *
FROM de_db.dbt_spacex.successful_launches;

------------------------------------------------

CREATE OR REPLACE VIEW de_db.dbt_spacex.launches_per_rocket AS
    --- CTE - catching recent date per rocket using ---
    WITH recent_launch AS (
          SELECT r.name AS rocket_name,
            l.launch_date,
            RANK () OVER (PARTITION BY r.name ORDER BY l.launch_date DESC) AS rank
            FROM de_db.dbt_spacex.rockets r
            JOIN de_db.dbt_spacex.launches l 
            ON r.id = l.rocket
            QUALIFY rank = 1
    )
    
    SELECT r.name AS rocket_name,
    r.first_flight,
    --- Specific null handling of Starship rocket ---
    COALESCE(rl.launch_date, '2021-12-01') AS last_flight,
    COUNT(*) AS launches_counter,
    FROM de_db.dbt_spacex.rockets r
    LEFT JOIN de_db.dbt_spacex.launches l 
    ON r.id = l.rocket
    LEFT JOIN recent_launch rl
    ON rl.rocket_name = r.name
    GROUP BY r.name, r.first_flight, rl.launch_date;


SELECT *
FROM de_db.dbt_spacex.launches_per_rocket;


------------------------------------------------
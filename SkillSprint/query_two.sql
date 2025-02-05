# Check-up whether the proposed session time overlaps with any existing
# sessions at the same venue

SELECT *
FROM schedule
WHERE venue_id = 2 AND
end_time >= "2024-09-14 09:00" AND
start_time <= "2024-09-14 11:00";

SELECT id,
name,
date(to_timestamp(first_flight)) AS first_flight,
cost_per_launch,
country,
success_rate_pct,
active
from {{source('public', 'rockets')}}
SELECT id,
name,
date(to_timestamp(date_utc)) AS launch_date,
success,
rocket

from {{source('public', 'launches')}}
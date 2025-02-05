# Query displaying the 3 sessions
# that have received the highest ratings from
# young Attendees (under 25 years old). Only include
# events that happened in specific country (in my case Portugal).
# The output shows session's title, the speaker's full name, and the average rating from young attendees.

  
WITH result_one AS (
  SELECT sc.session_id,
  AVG(rev.rating) AS avg_rating
  FROM attendees att
  JOIN registrations reg
  	ON att.attendee_id = reg.attendee_id
  JOIN reviews rev
  	ON rev.registration_id = reg.registration_id
  JOIN schedule sc
  	ON sc.event_id = reg.event_id
  JOIN venues v
  	ON v.venue_id = sc.venue_id
  WHERE TIMESTAMPDIFF(YEAR, att.dob, reg.registration_date) < 25
  AND v.country = 'Portugal'
  GROUP BY sc.session_id
  ORDER BY avg_rating DESC
  LIMIT 3
)

SELECT ses.title,
CONCAT(sp.first_name, ' ', sp.last_name) AS speaker_full_name,
ro.avg_rating
FROM sessions ses
JOIN result_one ro
	ON ses.session_id = ro.session_id
JOIN speakers sp
	ON sp.speaker_id = ses.speaker_id;

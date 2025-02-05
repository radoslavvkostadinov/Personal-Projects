USE skillsprint;


# Update to make titles easier to observe based on the speaker's area of expertise.
UPDATE sessions se
JOIN speakers sp
	ON sp.speaker_id = se.speaker_id
SET title = CONCAT(se.title,' (',sp.expertise_area,')');
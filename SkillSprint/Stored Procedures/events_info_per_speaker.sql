DELIMITER $$
CREATE PROCEDURE EventsInfoPerSpeaker (
IN p_speaker_id INT
)
BEGIN
    IF p_speaker_id NOT IN (SELECT DISTINCT speaker_id
						FROM speakers
						)
	THEN
		SIGNAL SQLSTATE '45000'
		SET MESSAGE_TEXT = 'Speaker ID does not exist';
	ELSE
		SELECT CONCAT(sp.first_name, " ",sp.last_name) AS full_name,
		ses.title,
		v.name AS venue_name,
		v.address,
		sc.start_time,
		sc.end_time
		FROM sessions ses
		JOIN schedule sc
			ON ses.session_id = sc.session_id
		JOIN venues v
			ON v.venue_id = sc.venue_id
		JOIN speakers sp
			ON sp.speaker_id = ses.speaker_id
		WHERE sp.speaker_id = p_speaker_id
        ORDER BY venue_name;
	END IF;
END $$
DELIMITER ;






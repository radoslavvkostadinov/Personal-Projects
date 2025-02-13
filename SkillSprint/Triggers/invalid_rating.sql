# Trigger that prevents inserting ratings with irrelevant dates.
DELIMITER $$
	CREATE TRIGGER invalid_rating
    BEFORE INSERT
    ON reviews
    FOR EACH ROW
			BEGIN
		IF NEW.rating NOT BETWEEN 1 AND 5
        THEN
			SIGNAL SQLSTATE '45000'
            SET MESSAGE_TEXT = 'Cannot insert rating different than 1, 2, 3, 4 or 5';
		ELSEIF (SELECT DATE(registration_date)
			FROM registrations
            WHERE registration_id = NEW.registration_id
            ) >= DATE(NEW.review_date)
		THEN
			SIGNAL SQLSTATE '45000'
            SET MESSAGE_TEXT = 'Review date cannot be less than or equal on registration date';
		ELSEIF DATE(NEW.review_date) <=
				(SELECT DATE(sc.start_time)
				FROM schedule sc
				JOIN registrations reg
					ON sc.event_id = reg.event_id
				WHERE registration_id = NEW.registration_id
                    )
				THEN
				SIGNAL SQLSTATE '45000'
            SET MESSAGE_TEXT = 'Review date  date cannot be less than or equal on start time';
		END IF;
 END $$
 DELIMITER ;
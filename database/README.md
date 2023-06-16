/* THEN YOU BOOK HIM THIS SERVICE WITH A BOOKING NO OR ID (blood chemistry analysis FOR EXAMPLE)  Test result default NULL*/

SELECT test_id INTO @booked_test
FROM test
WHERE test.title = 'blood chemistry analysis';

INSERT INTO booking (patient_user_name, test_id, booking_no, booking_date)
VALUES ('mahmou__d', @booked_test, '0001', '2023-06-16');

/* adding the test result */

UPDATE booking
SET test_result = 'positive'
WHERE patient_user_name = 'mahmou__d';

/* To get the test result after all done */

SELECT test_result
FROM booking
WHERE patient_user_name = 'mahmou__d';# CHOLab
This is a webs
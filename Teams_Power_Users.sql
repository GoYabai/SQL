DROP TABLE IF EXISTS messages;
CREATE TABLE messages (
    message_id integer,
    sender_id integer,
    receiver_id integer,
    content varchar,
    sent_date timestamp
);

INSERT INTO messages (message_id, sender_id, receiver_id, content, sent_date) 
VALUES
    (901, 3601, 4500, 'You up?', '2022-08-03 16:43:00'),
    (743, 3601, 8752, 'Let''s take this offline', '2022-06-14 14:30:00'),
    (888, 3601, 7855, 'DataLemur has awesome user base!', '2022-08-12 08:45:00'),
    (100, 2520, 6987, 'Send this out now!', '2021-08-16 00:35:00'),
    (898, 2520, 9630, 'Are you ready for your upcoming presentation?', '2022-08-13 14:35:00'),
    (990, 2520, 8520, 'Maybe it was done by the automation process.', '2022-08-19 06:30:00'),
    (819, 2310, 4500, 'What''s the status on this?', '2022-07-10 15:55:00'),
    (922, 3601, 4500, 'Get on the call', '2022-08-10 17:03:00');

SELECT
  sender_id,
  COUNT(message_id) AS message_count
FROM messages
WHERE EXTRACT(MONTH FROM sent_date) = 8
  AND EXTRACT(YEAR FROM sent_date) = 2022
GROUP BY sender_id
ORDER BY message_count DESC
LIMIT 2
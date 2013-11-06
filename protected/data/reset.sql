SET FOREIGN_KEY_CHECKS=0;
TRUNCATE buses;
TRUNCATE drivers;
TRUNCATE jammers;
TRUNCATE location;
TRUNCATE routes;
TRUNCATE schedules;
TRUNCATE tickets;
DELETE FROM users where id > 2;
DELETE FROM profiles where user_id > 2;
UPDATE counter SET value = 0 WHERE value > 0;

SET FOREIGN_KEY_CHECKS=1;


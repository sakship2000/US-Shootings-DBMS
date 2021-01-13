--complex queries
SELECT CAST(AVG(shooter.age) as int) as avg_age 
FROM SHOOTER;

SELECT COUNT(shooter_id), race
FROM shooter
GROUP BY race;

SELECT record.record_id, victim.state_name 
FROM record INNER JOIN victim 
ON record.victim_id = victim.victim_id;

SELECT COUNT(type_of_shooting), type_of_shooting
FROM record
GROUP BY type_of_shooting
ORDER BY COUNT(type_of_shooting) DESC;

SELECT *
FROM US_STATE
WHERE POLICE_BUDGET_PER_CAPITA BETWEEN 300 AND 500;

SELECT us_state.state_name, us_state.registered_weapons, us_state.police_budget_per_capita,
us_state.black_population_by_percent, shooter.race
FROM us_state RIGHT JOIN shooter
ON shooter.state_name = us_state.state_name
ORDER BY(registered_weapons) DESC;

CREATE VIEW male_accounts AS
SELECT FIRST_NAME, LAST_NAME
FROM USER_ACCOUNT
WHERE GENDER = 'MALE';

SELECT * FROM male_accounts;

CREATE VIEW teenage_victims AS
SELECT FIRST_NAME, LAST_NAME
FROM VICTIM
WHERE AGE BETWEEN 13 AND 19;

SELECT * FROM teenage_victims;

CREATE VIEW school_shooting_dates AS
SELECT MONTH_OF_SHOOTING, YEAR_OF_SHOOTING
FROM RECORD
WHERE TYPE_OF_SHOOTING = 'SCHOOL';

SELECT * FROM school_shooting_dates;
!/bin/sh
sqlplus64 "username/password@(DESCRIPTION=(ADDRESS=(PROTOCOL=TCP)(Host=oracle.scs.ryerson.ca)(Port=1521))(CONNECT_DATA=(SID=orcl)))" <<EOF

--Simple Queries
SELECT * FROM SHOOTER --shows shooters who are less than 30 years old
WHERE AGE <= 30;
 
SELECT TYPE_OF_SHOOTING, MONTH_OF_SHOOTING, YEAR_OF_SHOOTING --shows type and month of shooting for the year 2019
FROM RECORD 
WHERE YEAR_OF_SHOOTING = 2019;
 
SELECT * --shows US states with over 200000 registered weapons
FROM US_STATE
WHERE REGISTERED_WEAPONS > 200000;
 
SELECT GENDER, AGE, STATE_NAME --shows gender of victim and state where they died, for victims age 19 and older
FROM VICTIM 
WHERE AGE >=19;
 
SELECT * --shows female user accounts
FROM USER_ACCOUNT 
WHERE NOT(GENDER = 'FEMALE');
 
SELECT DISTINCT STATE_NAME AS WEALTHY_STATES --shows states with police budget per capita greater than 300
FROM US_STATE
WHERE POLICE_BUDGET_PER_CAPITA > '300'
ORDER BY STATE_NAME;
 
SELECT SHOOTER_ID, LAST_NAME, AGE, GENDER, RACE, STATE_NAME --shows Arizona shooting with either a black shooter or a white shooter
FROM SHOOTER
WHERE (RACE = 'BLACK' AND STATE_NAME = 'ARIZONA')
OR
(RACE = 'WHITE' AND STATE_NAME = 'ARIZONA');

--complex queries
SELECT CAST(AVG(shooter.age) as int) as avg_age --computes average age of shooter
FROM SHOOTER;
 
SELECT COUNT(shooter_id), race --counts the number of white and black shooters
FROM shooter
GROUP BY race;
 
SELECT record.record_id, victim.state_name --shows inner join of record_id and state name
FROM record INNER JOIN victim 
ON record.victim_id = victim.victim_id;
 
SELECT COUNT(type_of_shooting), type_of_shooting --counts number of different types of shootings, listen in descending order
FROM record
GROUP BY type_of_shooting
ORDER BY COUNT(type_of_shooting) DESC;
 
SELECT * FROM US_STATE --lists US states with police budget per capita between 300 and 500
WHERE POLICE_BUDGET_PER_CAPITA BETWEEN 300 AND 500;
 
SELECT us_state.state_name, us_state.registered_weapons, --right joins shooter to US state by state name, ordered by registered weapons in descending order
us_state.police_budget_per_capita, 
us_state.black_population_by_percent, shooter.race
FROM us_state RIGHT JOIN shooter
ON shooter.state_name = us_state.state_name
ORDER BY(registered_weapons) DESC;
 
CREATE VIEW male_accounts AS --creates a view of male user accounts, displaying their  first and last name
SELECT FIRST_NAME, LAST_NAME
FROM USER_ACCOUNT
WHERE GENDER = 'MALE';
 
SELECT * FROM male_accounts;
 
drop VIEW male_accounts;

CREATE VIEW teenage_victims AS --creates a view of teenage victims, displaying their first and last name
SELECT FIRST_NAME, LAST_NAME
FROM VICTIM
WHERE AGE BETWEEN 13 AND 19;
 
SELECT * FROM teenage_victims;
 
drop VIEW teenage_victims;
 
CREATE VIEW school_shooting_dates AS --creates a view of school shooting dates, displaying the month and year of the shooting
SELECT MONTH_OF_SHOOTING, YEAR_OF_SHOOTING
FROM RECORD
WHERE TYPE_OF_SHOOTING = 'SCHOOL';
 
SELECT * FROM school_shooting_dates;
 
drop VIEW school_shooting_dates;


exit;
EOF
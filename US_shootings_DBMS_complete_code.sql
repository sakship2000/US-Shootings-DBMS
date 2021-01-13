--Create table statements
 
CREATE TABLE US_STATE (
    STATE_NAME  VARCHAR(50) NOT NULL,
    REGISTERED_WEAPONS     NUMBER,
    BLACK_POPULATION_BY_PERCENT  NUMBER,
    POLICE_BUDGET_PER_CAPITA NUMBER,
    PRIMARY KEY (STATE_NAME)
);
 
CREATE TABLE SHOOTER (
    SHOOTER_ID  VARCHAR(10) NOT NULL,
    FIRST_NAME  VARCHAR(50),
    LAST_NAME   VARCHAR(50),
    AGE         NUMBER(3),
    GENDER      VARCHAR(10),
    RACE        VARCHAR(20),
    WEAPON_TYPE VARCHAR(50),
    OCCUPATION  VARCHAR(50),
    STATE_NAME  VARCHAR(50) NOT NULL,
    PRIMARY KEY (SHOOTER_ID),
    FOREIGN KEY (STATE_NAME) REFERENCES US_STATE(STATE_NAME)
);
 
CREATE TABLE VICTIM (
    VICTIM_ID   VARCHAR(10)  NOT NULL,
    FIRST_NAME  VARCHAR(50),
    LAST_NAME   VARCHAR(50),
    GENDER      VARCHAR(10),
    AGE         NUMBER(3),
    STATE_NAME  VARCHAR(50) NOT NULL,
    SHOOTER_ID VARCHAR(10) NOT NULL,
    PRIMARY KEY (VICTIM_ID),
    FOREIGN KEY (STATE_NAME) REFERENCES US_STATE(STATE_NAME),
    FOREIGN KEY (SHOOTER_ID) REFERENCES SHOOTER(SHOOTER_ID)
);
 
CREATE TABLE RECORD (
    RECORD_ID   VARCHAR(10) NOT NULL,
    TYPE_OF_SHOOTING    VARCHAR(50),
    MONTH_OF_SHOOTING   VARCHAR(10),
    YEAR_OF_SHOOTING    NUMBER(4),
    VICTIM_ID VARCHAR(10) NOT NULL,
    PRIMARY KEY (RECORD_ID),
    FOREIGN KEY (VICTIM_ID) REFERENCES VICTIM(VICTIM_ID)
);
 
CREATE TABLE USER_ACCOUNT (
    FIRST_NAME  VARCHAR(50) NOT NULL,
    LAST_NAME   VARCHAR(50) NOT NULL,
    AGE         NUMBER(3),
    GENDER      VARCHAR(10),
    EMAIL       VARCHAR(50),
    RECORD_ID VARCHAR(10) NOT NULL,
    PRIMARY KEY (EMAIL),
    FOREIGN KEY (RECORD_ID) REFERENCES RECORD(RECORD_ID)
);
 
--Insert statements to populate tables
 
INSERT INTO US_STATE VALUES ('ALABAMA', '168265', '26',  '261');
INSERT INTO US_STATE VALUES ('ALASKA','20520','3', '494');
INSERT INTO US_STATE VALUES ('ARIZONA','204817','4', '326');
INSERT INTO US_STATE VALUES ('ARKANSAS','108801', '15', '228');
INSERT INTO US_STATE VALUES ('CALIFORNIA','376666', '5', '448');
INSERT INTO US_STATE VALUES ('TEXAS', '108493', '9',  '232');
INSERT INTO US_STATE VALUES ('NEW_YORK','21340','22', '494');
INSERT INTO US_STATE VALUES ('ILLINOIS','19273','5', '290');
INSERT INTO US_STATE VALUES ('FLORIDA','101023', '6', '452');
INSERT INTO US_STATE VALUES ('MICHIGAN','237192', '3', '293');
 
INSERT INTO SHOOTER VALUES ('SH1', 'ROBERT BENJAMIN', 'SMITH', '18', 'MALE','WHITE','PISTOL',NULL, 'ARIZONA');
INSERT INTO SHOOTER VALUES ('SH2', 'SEDRICK', 'NORRIS', '36', 'MALE','BLACK','RIFLE',NULL, 'ALABAMA');
INSERT INTO SHOOTER VALUES ('SH3', 'MARIO', 'TONY', '20', 'MALE','BLACK','PISTOL','STUDENT', 'ARKANSAS');
INSERT INTO SHOOTER VALUES ('SH4', NULL, 'JONES', '23', 'MALE','WHITE','HANDGUN',NULL, 'CALIFORNIA');
INSERT INTO SHOOTER VALUES ('SH5', 'EVAN', 'RAMSEY', '16', 'MALE','WHITE','SHOTGUN','STUDENT', 'ALASKA');
INSERT INTO SHOOTER VALUES ('SH6', 'ARCHIBALD', 'WISE', '39', 'MALE','WHITE','HANDGUN',NULL, 'ARIZONA');
INSERT INTO SHOOTER VALUES ('SH7', 'HARRY', 'MARAT', '21', 'MALE','BLACK','RIFLE','STUDENT', 'TEXAS');
INSERT INTO SHOOTER VALUES ('SH8', NULL, 'POLLINGER', '34', 'MALE','BLACK','PISTOL',NULL, 'NEW_YORK');
INSERT INTO SHOOTER VALUES ('SH9', NULL, 'HANSON', '23', 'MALE','WHITE','PISTOL',NULL, 'FLORIDA');
INSERT INTO SHOOTER VALUES ('SH10', 'JOHNATHAN', 'AUDREY', '19', 'MALE','BLACK','SHOTGUN','STUDENT', 'MICHIGAN');
 
INSERT INTO VICTIM VALUES ('VIC1', 'ROSE', 'ALEXANDER', 'FEMALE', NULL, 'ARIZONA', 'SH1');
INSERT INTO VICTIM VALUES ('VIC2', NULL, 'NORRIS', 'FEMALE', '35', 'ALABAMA', 'SH2');
INSERT INTO VICTIM VALUES ('VIC3', 'JAMIE', 'WILLINGER', 'MALE', '16', 'ARKANSAS', 'SH3');
INSERT INTO VICTIM VALUES ('VIC4', NULL, 'FITZGERALD', 'MALE', NULL, 'CALIFORNIA', 'SH4');
INSERT INTO VICTIM VALUES ('VIC5', 'JOHNATHAN', 'MILLS', 'MALE', '19', 'ALASKA', 'SH5');
INSERT INTO VICTIM VALUES ('VIC6', 'ANTHONY', 'MAVIS', 'MALE', NULL, 'ARIZONA', 'SH6');
INSERT INTO VICTIM VALUES ('VIC7', 'MARTHA', 'FINNIGAN', 'FEMALE', '24', 'TEXAS', 'SH7');
INSERT INTO VICTIM VALUES ('VIC8', 'HOLDEN', 'COOPER', 'MALE', '19', 'FLORIDA', 'SH8');
INSERT INTO VICTIM VALUES ('VIC9', NULL, 'CHUNG', 'FEMALE', '37', 'MICHIGAN', 'SH9');
INSERT INTO VICTIM VALUES ('VIC10', 'REENA', 'SHAH', 'MALE', '45', 'NEW_YORK', 'SH10');
 
INSERT INTO RECORD VALUES ('RCD1', 'SCHOOL', 'NOVEMBER', '2018', 'VIC1');
INSERT INTO RECORD VALUES ('RCD2', 'RESIDENTIAL', 'MAY', '2017', 'VIC2');
INSERT INTO RECORD VALUES ('RCD3', 'SCHOOL', 'OCTOBER', '2018', 'VIC3');
INSERT INTO RECORD VALUES ('RCD4', 'MASS', 'JANUARY', '2019', 'VIC4');
INSERT INTO RECORD VALUES ('RCD5', 'SCHOOL', 'MARCH', '2019', 'VIC5');
INSERT INTO RECORD VALUES ('RCD6', 'SCHOOL', 'NOVEMBER', '2018', 'VIC6');
INSERT INTO RECORD VALUES ('RCD7', 'RESIDENTIAL', 'FEBRUARY', '2019', 'VIC7');
INSERT INTO RECORD VALUES ('RCD8', 'MASS', 'JULY', '2020', 'VIC8');
INSERT INTO RECORD VALUES ('RCD9', 'SCHOOL', 'DECEMBER', '2017', 'VIC9');
INSERT INTO RECORD VALUES ('RCD10', 'MASS', 'JANUARY', '2018', 'VIC10');
 
INSERT INTO USER_ACCOUNT VALUES ('JEREMY','HIGGINS', '32', 'MALE','JHIGGINS@GMAIL.COM','RCD1');
INSERT INTO USER_ACCOUNT VALUES ('ELAINE','MURPHY', '19', 'FEMALE','ELMURPHY20S@GMAIL.COM','RCD2');
INSERT INTO USER_ACCOUNT VALUES ('SELENA','GARCIA', '24', 'FEMALE','SELG123@GMAIL.COM','RCD3');
INSERT INTO USER_ACCOUNT VALUES ('MIHAIL','NOTAH', '28', 'MALE','MIHAILNOTAH99@GMAIL.COM','RCD4');
INSERT INTO USER_ACCOUNT VALUES ('YONAH','RAYWOOD', '45', 'MALE','YOHANRAYWOOD@GMAIL.COM','RCD5');
INSERT INTO USER_ACCOUNT VALUES ('SOFIA','VIENNA', '19', 'FEMALE','SOFIAV99@GMAIL.COM','RCD6');
INSERT INTO USER_ACCOUNT VALUES ('BRIANNA','WRIGHT', '29', 'FEMALE','BRIBRIWRIGHT@GMAIL.COM','RCD7');
INSERT INTO USER_ACCOUNT VALUES ('PANAMA','MILLIGAN', '38', 'FEMALE','PANMILLI@GMAIL.COM','RCD8');
INSERT INTO USER_ACCOUNT VALUES ('HASSAN','SHAHID', '21', 'MALE','HASSANSHAHID@GMAIL.COM','RCD9');
INSERT INTO USER_ACCOUNT VALUES ('SID','WALLID', '52', 'MALE','SIDWAL@GMAIL.COM','RCD10');
 
SELECT * FROM US_STATE;
SELECT * FROM VICTIM;
SELECT * FROM SHOOTER;
SELECT * FROM RECORD;
SELECT * FROM USER_ACCOUNT;
 
 
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
 
SELECT * --lists US states with police budget per capita between 300 and 500
FROM US_STATE
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

CREATE TABLE US_STATE (
    STATE_NAME  VARCHAR(50) NOT NULL,
    REGISTERED_WEAPONS     NUMBER,
    BLACK_POPULATION_BY_PERCENT  NUMBER,
    POLICE_BUDGET_PER_CAPITA NUMBER,
    PRIMARY KEY (STATE_NAME)
);


CREATE TABLE VICTIM (
    VICTIM_ID   VARCHAR(10)  NOT NULL,
    FIRST_NAME  VARCHAR(50),
    LAST_NAME   VARCHAR(50),
    GENDER      VARCHAR(10),
    AGE         NUMBER(3),
    STATE_NAME  VARCHAR(50) NOT NULL,
    PRIMARY KEY (VICTIM_ID),
    FOREIGN KEY (STATE_NAME) REFERENCES US_STATE(STATE_NAME)
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

CREATE TABLE RECORD (
    RECORD_ID   VARCHAR(10) NOT NULL,
    TYPE_OF_SHOOTING    VARCHAR(50),
    MONTH_OF_SHOOTING   VARCHAR(10),
    YEAR_OR_SHOOTING    NUMBER(4),
    VICTIM_ID VARCHAR(10) NOT NULL,
    SHOOTER_ID VARCHAR(10) NOT NULL,
    PRIMARY KEY (RECORD_ID),
    FOREIGN KEY (VICTIM_ID) REFERENCES VICTIM(VICTIM_ID),
    FOREIGN KEY (SHOOTER_ID) REFERENCES SHOOTER(SHOOTER_ID)
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


